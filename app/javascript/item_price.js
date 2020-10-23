function price (){
  const item_price  = document.getElementById("item-price");
  item_price.addEventListener("keyup", () => {
    const item_priceVal = Math.floor(item_price.value * 0.1);
    const tax_num = document.getElementById("add-tax-price");
    tax_num.innerHTML = `${item_priceVal}`;
    const prof = item_price.value - item_priceVal;
    const profit_num = document.getElementById("profit");
    profit_num.innerHTML = `${prof}`;
  });
}
window.addEventListener("keypress", price);
