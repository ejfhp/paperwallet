import 'arts.dart';
import 'wallet.dart';
import 'main.dart';
import 'package:flutter/material.dart';

class BitPaperState extends State<BitPaper> {
  Map<String, Art> arts = Map<String, Art>();
  List<Wallet> wallets = List<Wallet>.empty(growable: true);
  String selected = "bitcoin";

  BitPaperState() {
    int initialWallets = 2;
    getArts(this);
    for (int i = 0; i < initialWallets; i++) {
      Wallet w = Wallet();
      wallets.add(w);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BitPaperUI(this);
  }

  void setSelected(String sel) {
    setState(() {
      selected = sel;
    });
  }

  Art getSelectedArt() {
    return this.arts[this.selected];
  }

  void addArt(String name, Art art) async {
    setState(() {
      print("Adding Art: " + name);
      arts.putIfAbsent(name, () => art);
    });
  }
}