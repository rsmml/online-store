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

const element = document.getElementById('stock-id');
if (element) {
  const room_id = element.getAttribute('data-stock-id');

  consumer.subscriptions.create({ channel: "StockChannel", stock_id: room_id }, {
    connected() {
      console.log('Connected to Stock: ' + room_id);
    },

    received(data) {
      console.log(data); // called when data is broadcast in the cable
    },
  });
}
