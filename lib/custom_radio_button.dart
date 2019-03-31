library custom_radio_button;

import 'package:flutter/material.dart';

import 'radio_model.dart';

class CustomRadioGroupWidget extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final bool isSquareRadioGroup;
  final List<RadioModel> radioList;

  const CustomRadioGroupWidget(
      {Key key, this.isSquareRadioGroup, this.radioList, this.onChanged})
      : super(key: key);

  @override
  _CustomRadioGroupWidgetState createState() => _CustomRadioGroupWidgetState();
}

class _CustomRadioGroupWidgetState extends State<CustomRadioGroupWidget> {
  String _selectedValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 50.0),
      child: widget.isSquareRadioGroup
          ? _buildSquareRadioList()
          : _buildRoundRadioGroup(),
    );
  }

  Widget _buildSquareRadioList() {
    return Container(
      decoration: new BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0, // has the effect of softening the shadow
              spreadRadius: 3.0, // has the effect of extending the shadow
              offset: Offset(
                5.0, // horizontal, move right 10
                5.0, // vertical, move down 10
              ),
            )
          ],
          borderRadius: const BorderRadius.all(const Radius.circular(50.0)),
          color: Colors.white),
      width: 250.0,
      height: 360.0,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(const Radius.circular(50.0)),
        child: new ListView.builder(
          itemCount: widget.radioList.length,
          itemBuilder: (BuildContext context, int index) {
            return new InkWell(
              onTap: () {
                setState(() {
                  widget.radioList
                      .forEach((element) => element.isSelected = false);
                  widget.radioList[index].isSelected = true;
                  _selectedValue = widget.radioList[index].text;
                  _publishSelection(_selectedValue);
                });
              },
              child: new SquareRadioItem(widget.radioList[index]),
            );
          },
        ),
      ),
    );
  }

  Widget _buildRoundRadioGroup() {
    return new ListView.builder(
      itemCount: widget.radioList.length,
      itemBuilder: (BuildContext context, int index) {
        return new InkWell(
          onTap: () {
            setState(() {
              widget.radioList.forEach((element) => element.isSelected = false);
              widget.radioList[index].isSelected = true;
              _selectedValue = widget.radioList[index].text;
              _publishSelection(_selectedValue);
            });
          },
          child: new RoundRadioItem(widget.radioList[index]),
        );
      },
    );
  }

  void _publishSelection(selectedValue) {
    if (widget.onChanged != null) {
      widget.onChanged(selectedValue);
    }
  }
}

class SquareRadioItem extends StatelessWidget {
  final RadioModel _item;
  SquareRadioItem(this._item);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      width: double.infinity,
      child: new Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _item.radioIcon != null
                  ? IconButton(
                icon: _item.radioIcon,
                onPressed: null,
              )
                  : Container(),
              new Text(_item.text,
                  style: new TextStyle(
                      color: _item.isSelected ? Colors.white : Colors.black,
                      //fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold)),
            ],
          )),
      decoration: new BoxDecoration(
        color: _item.isSelected ? _item.selectedColor : Colors.white,
        border: new Border.all(
            width: 1.0,
            color: _item.isSelected ? _item.selectedColor : Colors.white),
      ),
    );
  }
}

class RoundRadioItem extends StatelessWidget {
  final RadioModel _item;

  RoundRadioItem(this._item);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
      new EdgeInsets.only(left: 25.0, right: 25.0, top: 8.0, bottom: 8.0),
      height: 80.0,
      width: double.infinity,
      child: new Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _item.radioIcon != null
                  ? IconButton(
                icon: _item.radioIcon,
                onPressed: null,
              )
                  : Container(),
              new Text(_item.text,
                  style: new TextStyle(
                      color: _item.isSelected ? Colors.white : Colors.black,
                      //fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold)),
            ],
          )),
      decoration: new BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10.0, // has the effect of softening the shadow
            spreadRadius: 3.0, // has the effect of extending the shadow
            offset: Offset(
              5.0, // horizontal, move right 10
              5.0, // vertical, move down 10
            ),
          )
        ],
        color: _item.isSelected ? _item.selectedColor : Colors.white,
        border: new Border.all(
            width: 1.0,
            color: _item.isSelected ? _item.selectedColor : Colors.white),
        borderRadius:
        const BorderRadius.all(const Radius.elliptical(100.0, 100.0)),
      ),
    );
  }
}
