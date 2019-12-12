import 'package:flutter/material.dart';

class DataTablePage extends StatefulWidget {
  DataTablePage({Key key}) : super(key: key);

  @override
  _DataTablePageState createState() => _DataTablePageState();
}

class _DataTablePageState extends State<DataTablePage> {

  bool sortFlag;
  List<User> _usersList;
  List<User> _selectedUsers;

  @override
  void initState() {
    sortFlag = false;
    _usersList = User.getUsersList();
    _selectedUsers = [];
    super.initState();
  }

  onSortColumn(int columnIndex, bool ascending){
    if(columnIndex == 0){
      if(ascending){
        _usersList.sort((a, b) => a.firstName.compareTo(b.firstName));
      }else{
        _usersList.sort((a, b) => b.firstName.compareTo(a.firstName));
      }
    }
  }

  onSortColumnLastName(int columnIndex, bool ascending){
    if(columnIndex == 0){
      if(ascending){
        _usersList.sort((a, b) => a.firstName.compareTo(b.firstName));
      }else{
        _usersList.sort((a, b) => b.firstName.compareTo(a.firstName));
      }
    }
  }

  onSelectedRow(bool selected, User user){
    setState(() {
      if(selected){
        _selectedUsers.add(user);
      }else{
        _selectedUsers.remove(user);
      }
    });
  }

  deletedSelected()async{
    setState(() {
      if(_selectedUsers.isNotEmpty){
        List<User> tempList = [];
        tempList.addAll(_selectedUsers);
        for(User user in tempList){
          _usersList.remove(user);
          _selectedUsers.remove(user);
        }
      }
    });
  }

  SingleChildScrollView databody(){
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        sortAscending: sortFlag,
        columns: [
          DataColumn(
            label: Text("FirstName"),
            numeric: false,
              tooltip: "This is First Name",
              onSort: (columnIndex, ascending) {
                setState(() {
                  sortFlag = !sortFlag;
                });
                onSortColumn(columnIndex, ascending);
              }
          ),
          DataColumn(
            label: Text("LastName")
          )
        ],
        rows: _usersList.map((user) => 
          DataRow(
            selected: _selectedUsers.contains(user),
            onSelectChanged: (b){
              onSelectedRow(b, user);
            },
            cells: [
              DataCell(
                Text("${user.firstName}")
              ),
              DataCell(
                Text("${user.lastName}")
              )
            ],
          )
        ).toList(),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Selected ${_selectedUsers.length}"),),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Expanded(child: databody(),),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
                child: OutlineButton(
                  child: Text("SELECTED ${_selectedUsers.length}"),
                  onPressed: (){},
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: OutlineButton(
                  child: Text('DELETE SELECTED'),
                  onPressed: _selectedUsers.isEmpty
                      ? null
                      : () {
                          deletedSelected();
                        },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class User{
  String firstName;
  String lastName;

  User({this.firstName, this.lastName});

  static List<User> getUsersList(){
    return <User>[
      User(firstName: "Shvikant", lastName: "Sawarkar"),
      User(firstName: "Hemant", lastName: "Thawali"),
      User(firstName: "Amol", lastName: "Khode"),
      User(firstName: "Ajinkya", lastName: "Diware"),
      User(firstName: "Ajinkya", lastName: "Diware"),
      User(firstName: "Ajinkya", lastName: "Diware"),
      User(firstName: "Ajinkya", lastName: "Diware"),
      User(firstName: "Ajinkya", lastName: "Diware"),
      User(firstName: "Ajinkya", lastName: "Diware"),
      User(firstName: "Ajinkya", lastName: "Diware"),
    ];
  }
}