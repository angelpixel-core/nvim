type Item = {
  name: string;
  price: number;
  qty: number;
};

const subtotal = (items: Item[]): number => {
  return items.reduce((acc, item) => acc + item.price * item.qty, 0);
};

const total = (items: Item[], taxRate = 0.21): number => {
  const base = subtotal(items);
  return base + base * taxRate;
};

const cart: Item[] = [
  { name: "book", price: 10, qty: 2 },
  { name: "pen", price: 2.5, qty: 3 },
];

console.log(total(cart));
