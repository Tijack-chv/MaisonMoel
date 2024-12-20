/*

showDialog<String>(
context: context,
builder: (BuildContext context) => AlertDialog(
title: const Text('Le bouton (container) a été tappé'),
content: const Text('Ceci fera la connexion de lapp'),
actions: <Widget>[
TextButton(
onPressed: () => Navigator.pop(context, 'Cancel'),
child: const Text('Annuler'),
),
TextButton(
onPressed: () => Navigator.pop(context, 'OK'),
child: const Text('Confirmer'),
),
],
),

*/
