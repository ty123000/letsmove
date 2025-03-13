module tycoin::cnty {

    use std::option;
    use sui::coin::TreasuryCap;
    use sui::url::Url;
    use sui::transfer::{public_transfer, public_freeze_object};

    public struct CNTY has drop {}

    fun init(usdy: CNTY, ctx: &mut TxContext) {

        let (cap, meta) = sui::coin::create_currency(
            usdy,
            8u8,
            b"CNTY",
            b"CNTY",
            b"USDY",
            option::none<Url>(),
            ctx
        );
        public_transfer(cap, ctx.sender());
        public_freeze_object(meta);
    }

    public fun mint(cap: &mut TreasuryCap<CNTY>, amount: u64,to: address, ctx: &mut TxContext) {
        let suty_coin = sui::coin::mint(cap, amount, ctx);
        public_transfer(suty_coin, to)
    }
}