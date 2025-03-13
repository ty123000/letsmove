module faucet_tycoin::usty {

    use std::option;
    use sui::coin::TreasuryCap;
    use sui::url::Url;
    use sui::transfer::{public_transfer, public_freeze_object, public_share_object};

    public struct USTY has drop {}

    fun init(usdy: USTY, ctx: &mut TxContext) {

        let (cap, meta) = sui::coin::create_currency(
            usdy,
            8u8,
            b"FAUCET_USTY",
            b"FAUCET_USTY",
            b"FAUCET_USTY",
            option::none<Url>(),
            ctx
        );
        public_share_object(cap);
        public_freeze_object(meta);
    }

    public fun mint(cap: &mut TreasuryCap<USTY>, amount: u64,to: address, ctx: &mut TxContext) {
        let suty_coin = sui::coin::mint(cap, amount, ctx);
        public_transfer(suty_coin, to)
    }
}