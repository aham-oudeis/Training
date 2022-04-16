'use strict';

function createPayment(services = {}) {
  return {
    phone: services.phone || 0,
    internet: services.internet || 0,
    amount: services.amount,
    total() {
      return this.amount || (this.phone + this.internet);
    },
  }
}

function createInvoice(services = {}) {
  return {
    payments: [],
    phone: services.phone || 3000,
    internet: services.internet || 5500,
    total: function() {
      return this.phone + this.internet;
    },
    addPayment(onePayment) {
      if (onePayment === undefined) return;
      this.payments.push(onePayment)
    },

    addPayments(listOfPayments) {
      this.payments.push(...listOfPayments)
    },

    amountDue() {
      return this.total() - this.totalPayment();
    },

    totalPayment() {
      return this.payments.reduce((sum, payment) => sum + payment.total(), 0);
    }
  };
}

let invoice = createInvoice({
  phone: 1200,
  internet: 4000,
});

let payment1 = createPayment({
  amount: 2000,
});

let payment2 = createPayment({
  phone: 1000,
  internet: 1200,
});

let payment3 = createPayment({
  phone: 1000,
});

invoice.addPayment(payment1);
invoice.addPayments([payment2, payment3]);
invoice.amountDue();       // this should return 0
