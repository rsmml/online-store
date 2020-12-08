import consumer from "./consumer";

// const initStockUpdate = () => {
//   const stockContainer = document.getElementById('stock');
//   if (stockContainer) {
//     // const id = stockContainer.dataset.stockId;

//     consumer.subscriptions.create({ channel: "StockChannel" }, {
//       received(data) {
//         console.log("Connected to channel"); // called when data is broadcast in the cable
//       },
//     });
//   }
// }

// export { initStockUpdate };

consumer.subscriptions.create({ channel: "StockChannel" }, {
  connected() {
    console.log('Connecting...');
  },

  received(data) {
    console.log(data); // called when data is broadcast in the cable
  },
});
