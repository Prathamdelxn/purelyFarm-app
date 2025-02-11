import 'package:flutter/material.dart';

class PaymentMethodBottomSheet extends StatelessWidget {
  const PaymentMethodBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Bill Total',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '₹214.55',
                        style: TextStyle(
                          color: Colors.green[700],
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'RECOMMENDED',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 12),
          _buildPaymentOption(
            icon: Icons.account_balance,
            title: 'PhonePe UPI',
            showArrow: true,
          ),
          _buildPaymentOption(
            icon: Icons.g_mobiledata,
            title: 'Google Pay UPI',
            showArrow: true,
          ),
          const SizedBox(height: 24),
          const Text(
            'CARDS',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 12),
          _buildPaymentOption(
            icon: Icons.credit_card,
            title: 'Add Credit or Debit cards',
            showAdd: true,
          ),
          _buildPaymentOption(
            icon: Icons.account_balance_wallet,
            title: 'Add Pluxee',
            showAdd: true,
          ),
          const SizedBox(height: 24),
          const Text(
            'PAY BY ANY UPI APP',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 12),
          _buildPaymentOption(
            icon: Icons.qr_code,
            title: 'Add new UPI ID',
            showAdd: true,
          ),
          const SizedBox(height: 24),
          const Text(
            'Cash On Delivery',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 12),
          _buildPaymentOption(
            icon: Icons.money,
            title: 'Cash On Delivery',
            showArrow: true,
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentOption({
    required IconData icon,
    required String title,
    bool showArrow = false,
    bool showAdd = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, size: 24, color: Colors.grey[700]),
              const SizedBox(width: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          if (showArrow)
            const Icon(Icons.arrow_forward_ios, size: 16)
          else if (showAdd)
            Text(
              'ADD',
              style: TextStyle(
                color: Colors.red[400],
                fontWeight: FontWeight.w600,
              ),
            ),
        ],
      ),
    );
  }
}