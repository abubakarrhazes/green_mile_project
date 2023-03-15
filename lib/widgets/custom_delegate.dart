import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate{

   List<String> searchTerms = [
    "Emergency",
    "Call a Lawyer",
    "Report Abuse",
    "Support Chat",
    "Profile",
  ];

  
@override
List<Widget>? buildActions(BuildContext context) {
	return [
	IconButton(
		onPressed: () {
		query = '';
		},
		icon: const Icon(Icons.clear),
    color:Colors.deepPurpleAccent,
	),
	];
}


// to pop out of search menu
@override
Widget? buildLeading(BuildContext context) {
	return IconButton(
	onPressed: () {
		close(context, null);
	},
	icon: const Icon(Icons.arrow_back),
  color:Colors.deepPurpleAccent,
	);
}


//  to show query result
@override
Widget buildResults(BuildContext context) {
	List<String> matchQuery = [];
	for (var wards in searchTerms) {
	if (wards.toLowerCase().contains(query.toLowerCase())) {
		matchQuery.add(wards);
	}
	}
	return ListView.builder(
	itemCount: matchQuery.length,
	itemBuilder: (context, index) {
		var result = matchQuery[index];
		return ListTile(
		title: Text(result,
    style: const TextStyle(
      color:Colors.deepPurpleAccent,
      fontWeight: FontWeight.bold
    ),
    ),
    hoverColor: Colors.grey,
		);
	},
	);
}



// querying process at the runtime
@override
Widget buildSuggestions(BuildContext context) {
	List<String> matchQuery = [];
	for (var wards in searchTerms) {
	if (wards.toLowerCase().contains(query.toLowerCase())) {
		matchQuery.add(wards);
	}
	}
	return ListView.builder(
	itemCount: matchQuery.length,
	itemBuilder: (context, index) {
		var result = matchQuery[index];
		return ListTile(
		title: Text(result,
    style: const TextStyle(
      color:Colors.deepPurpleAccent,
      fontWeight: FontWeight.bold
    ),
    ),
		);
	},
	);
}

}

