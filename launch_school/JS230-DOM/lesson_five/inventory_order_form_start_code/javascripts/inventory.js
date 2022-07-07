var inventory;

(function() {
  inventory = {
    lastId: 0,
    collection: [],
    template: '',
    setDate: function() {
      var date = new Date();
      document.getElementById("order_date").textContent = date.toUTCString();
    },
    cacheTemplate: function() {
      var iTmpl = document.getElementById('inventory_item');
      this.template = iTmpl.textContent;
      iTmpl.remove();
    },
    add: function() {
      this.lastId++;
      var item = {
        id: this.lastId,
        name: "",
        stock_number: "",
        quantity: 1
      };
      this.collection.push(item);

      return item;
    },
    remove: function(idx) {
      this.collection = this.collection.filter(function(item) {
        return item.id !== idx;
      });
    },
    get: function(id) {
      var found_item;

      this.collection.forEach(function(item) {
        if (item.id === id) {
          found_item = item;
          return false;
        }
      });

      return found_item;
    },
    update: function(item) {
      var id = this.findID(item),
          item = this.get(id);

      let elementsWithName = Array.from(item.querySelectorAll('[name]'));

      for (let element of elementsWithName) {
        let name = element.getAttribute('name');

        if (name.startsWith('item_name')) item.name = element.value;
        if (name.startsWith('item_stock_number')) item.stock_number = element.value;
        if (name.startsWith('item_quantity')) item.quantity = element.value;
      }
    },
    newItem: function(e) {
      e.preventDefault();
      var item = this.add();
      let compileTemplate = Handlebars.compile(this.template);
      let itemHtml = compileTemplate(item);
      
      let inventoryTable = document.getElementById('inventory');
      let newTableRow = document.createElement('tr');

      newTableRow.innerHTML = itemHtml;

      inventoryTable.appendChild(newTableRow);
    },
    findParent: function(e) {
      let closest = e.target;

      while (closest.tagName !== 'TR') {
        let parent = closest.parentNode;
        closest = parent;
      }

      return closest; 
    },
    findID: function(item) {
      return Number(item.querySelector("input[type='hidden']").value);
      //return +$item.find("input[type=hidden]").val();
    },
    deleteItem: function(e) {
      e.preventDefault();
      var itemToDel = this.findParent(e);

      this.remove(this.findID(itemToDel));
      itemToDel.remove();
    },
    updateItem: function(e) {
      var $item = this.findParent(e);

      this.update($item);
    },
    bindEvents: function() {
      document.getElementById("add_item")
              .addEventListener("click", this.newItem.bind(this));
      let inventory = document.getElementById('inventory');
      let self = this;

      inventory.addEventListener('click', (event) => {
        let listOfLinks = Array.from(inventory.querySelectorAll('a.delete'));

        if (listOfLinks.includes(event.target)) {
          self.deleteItem.call(self, event);
        };
      });

      inventory.addEventListener('blur', (event) => {
        let selectors = 'input, textarea, select, button';
        let inputs = Array.from(inventory.querySelectorAll(selectors));

        if (inputs.includes(event.target)) { 
          self.updateItem.call(self, event);
        }
      });
      
      //$(inventory).on('blur', ':input', this.updateItem.bind(this));
    },
    init: function() {
      this.setDate();
      this.cacheTemplate();
      this.bindEvents();
    }
  };
})();

$(inventory.init.bind(inventory));
