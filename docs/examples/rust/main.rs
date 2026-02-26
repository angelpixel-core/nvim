#[derive(Debug)]
struct Item {
    name: String,
    price: f64,
    qty: u32,
}

fn subtotal(items: &[Item]) -> f64 {
    items.iter().map(|item| item.price * item.qty as f64).sum()
}

fn total(items: &[Item], tax_rate: f64) -> f64 {
    let base = subtotal(items);
    base + (base * tax_rate)
}

fn main() {
    let cart = vec![
        Item {
            name: "book".to_string(),
            price: 10.0,
            qty: 2,
        },
        Item {
            name: "pen".to_string(),
            price: 2.5,
            qty: 3,
        },
    ];

    println!("Total: {:.2}", total(&cart, 0.21));
}
