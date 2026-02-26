from dataclasses import dataclass
from typing import Iterable


@dataclass
class Item:
    name: str
    price: float
    qty: int


def subtotal(items: Iterable[Item]) -> float:
    return sum(item.price * item.qty for item in items)


def total(items: Iterable[Item], tax_rate: float = 0.21) -> float:
    base = subtotal(items)
    return base + (base * tax_rate)


cart = [Item("book", 10.0, 2), Item("pen", 2.5, 3)]
print(total(cart))
