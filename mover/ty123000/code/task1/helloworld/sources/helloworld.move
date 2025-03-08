module helloworld::helloty {
    use std::ascii::{String, string};

    public struct HelloWorld has key {
        id: UID,
        msg: String
    }

    public entry fun mint(ctx: &mut TxContext) {
        let hello = HelloWorld {
            id: object::new(ctx),
            msg: string(b"ty123000")
        };
        sui::transfer::transfer(hello, ctx.sender());
    }
}