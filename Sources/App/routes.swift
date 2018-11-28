import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }
    
    router.get("hello", String.parameter) { req -> String in
        let person = try req.parameters.next(String.self)
        return "Hello, \(person)!"
    }
    
    router.get("comments") { req in
        return Comment.query(on: req).all()
    }
    
    router.post(Comment.self, at: "comment") { req, comment -> Future<HTTPStatus> in
        if comment.text == comment.text.uppercased() {
            throw Abort(.badRequest, reason: "All caps comments are not allowed.")
        }
        
        return comment.save(on: req).transform(to: HTTPStatus.ok)
    }
}
