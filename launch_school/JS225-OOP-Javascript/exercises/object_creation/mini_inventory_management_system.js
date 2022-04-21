'use strict';

/*
this needs  a items creator, items manager, reports manager
--items creator needs:
    -makes sure that the necessary information is valid
    -SKU code:
      +unique identifier
      +consists of the first 3 letters of the item and
        first 2 letters of the category
        -if the name consists of two words and the first word consists of two
          words only, the next letter is taken from the nextword
    -item name:
      +minimum of 5 characters
      +spaces are not considered characters
    -category
      +it must consist of minimum of 5 characters and can be only one word
    -quantity
      +must not be blank
      +can assume that a valid numbers will be provided

*/

const Item = function () {
  function isValidCategory(category) {
    return category.length >= 5 &&   //must have minimum of 5 characters
           !/\s/.test(category);     //must not have spaces in between
  }

  function isValidItemName(name) {
    return name.replace(/\s/g, '').length >= 5;
  }

  function makeSkuCode(name, category) {
    let namePart = name.replace(/\s/, '').slice(0, 3);
    let categoryPart = category.slice(0, 2);

    return (namePart + categoryPart).toUpperCase();
  }

  function init(name, category, quantity) {
    const isValidItem = () => {
      return quantity !== undefined    &&
             isValidCategory(category) &&
             isValidItemName(name);
    };

    if (isValidItem()) {
      this.skuCode = makeSkuCode(name, category);
      this.itemName = name;
      this.category = category;
      this.quantity = quantity;

      return this;
    } else {
      return { notValid: true };
    }
  }

  return { init };
}();

const ItemManager = function() {
  const items = [];

  function create(name, category, quantity) {
    let item = Object.create(Item).init(name, category, quantity);

    if (Item.isPrototypeOf(item)) {
      this.items.push(item);
    }
  }

  function findIdxOf(skuCode, items) {
    return items.findIndex(obj => obj.skuCode === skuCode);
  }

  function update(skuCode, { quantity }) {
    let itemObjIdx = findIdxOf(skuCode, this.items);

    if (!(itemObjIdx === -1)) {
      this.items[itemObjIdx].quantity = quantity;
    }
  }

  function itemsInCategory(skuCode) {
    return this.items.filter(obj => obj.skuCode === skuCode);
  }

  function inStock() {
    return this.items.filter(itemObj => itemObj.quantity > 0);
  }

  return {
    items,
    create,
    itemsInCategory,
    update,
    inStock,
    delete(skuCode) {
      let itemIdx = findIdxOf(skuCode, this.items);
      this.items.splice(itemIdx, 1);
    },
  }
}();

const Reporter = {
  itemInfo() {
    this.items.forEach(item => {
      console.log('skuCode:', item.skuCode);
      console.log('itemName:', item.itemName);
      console.log('category:', item.category);
      console.log('quantity: ', item.quantity);
      console.log('_'.repeat(10));
    });
  }
};

const ReportManager = function() {
  function init(itemManager) {
    this.itemManager = ItemManager;
  }

  function createReporter(skuCode) {
    let items = this.itemManager.itemsInCategory(skuCode);

    let report = Object.create(Reporter);

    report.items = items;

    return report;
  }

  function reportInStock() {
    return this.itemManager.inStock().map(obj => obj.itemName).join(', ');
  }

  return {
    init,
    reportInStock,
    createReporter,
  }
}();

ItemManager.create('basket ball', 'sports', 0);
ItemManager.create('asd', 'sports', 0);
ItemManager.create('soccer ball', 'sports', 5);
ItemManager.create('football', 'sports');
ItemManager.create('football', 'sports', 3);
ItemManager.create('kitchen pot', 'cooking items', 0);
ItemManager.create('kitchen pot', 'cooking', 3);

//console.log(ItemManager.items);


ReportManager.init(ItemManager);
ReportManager.reportInStock();
// logs soccer ball,football,kitchen pot

ItemManager.update('SOCSP', { quantity: 0 });
ItemManager.inStock();
// returns list with the item objects for football and kitchen pot
ReportManager.reportInStock();
// logs football,kitchen pot
ItemManager.itemsInCategory('sports');
// returns list with the item objects for basket ball, soccer ball, and football
ItemManager.delete('SOCSP');
ItemManager.items;
// returns list with the remaining 3 valid items (soccer ball is removed from the list)

const kitchenPotReporter = ReportManager.createReporter('KITCO');
kitchenPotReporter.itemInfo();
// logs
// skuCode: KITCO
// itemName: kitchen pot
// category: cooking
// quantity: 3

ItemManager.update('KITCO', { quantity: 10 });
kitchenPotReporter.itemInfo();
// logs
// skuCode: KITCO
// itemName: kitchen pot
// category: cooking
// quantity: 10
