<script lang="ts">
  type Item = { name: string; price: number; qty: number };

  const cart: Item[] = [
    { name: "book", price: 10, qty: 2 },
    { name: "pen", price: 2.5, qty: 3 },
  ];

  const subtotal = (items: Item[]) => items.reduce((acc, item) => acc + item.price * item.qty, 0);
</script>

<main class="mx-auto max-w-xl p-6">
  <h1 class="text-2xl font-semibold">Svelte LSP Example</h1>
  <p class="mt-2">Subtotal: {subtotal(cart).toFixed(2)}</p>

  <ul class="mt-4 space-y-2">
    {#each cart as item}
      <li class="rounded border border-slate-200 p-3">
        {item.name} - {item.qty} x ${item.price}
      </li>
    {/each}
  </ul>
</main>
