import 'package:airplane/cubit/transaction_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void initState() {
    context.read<TransactionCubit>().fetchTransactions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        if (state is TransactionLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TransactionSuccess) {
          if (state.transactions.isEmpty) {
            return const Center(
              child: Text('Belum ada transaksi'),
            );
          } else {
            return ListView.builder(
              padding: EdgeInsets.only(
                left: defaultMargin,
                right: defaultMargin,
                bottom: 100,
              ),
              itemBuilder: (context, index) =>
                  TransactionCard(transaction: state.transactions[index]),
              itemCount: state.transactions.length,
            );
          }
        } else if (state is TransactionFailed) {
          return Center(child: Text(state.error));
        }
        return const Center(
          child: Text('Transaction Page'),
        );
      },
    );
  }
}
