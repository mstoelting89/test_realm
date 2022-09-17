import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/domain/entities/id.dart';
import 'package:todo/domain/entities/todo_color.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/todo.dart';

class TodoModel {
  final String id;
  final String title;
  final String body;
  final bool done;
  final int color;
  final dynamic serverTimestamp;

  TodoModel({required this.serverTimestamp,
    required this.id,
    required this.title,
    required this.body,
    required this.done,
    required this.color});

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'title': this.title,
      'body': this.body,
      'done': this.done,
      'color': this.color,
      'serverTimestamp': this.serverTimestamp,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: "",
      title: map['title'] as String,
      body: map['body'] as String,
      done: map['done'] as bool,
      color: map['color'] as int,
      serverTimestamp: map['serverTimestamp'] as dynamic,
    );
  }

  TodoModel copyWith({
    String? id,
    String? title,
    String? body,
    bool? done,
    int? color,
    dynamic serverTimestamp,
  }) {
    return TodoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      done: done ?? this.done,
      color: color ?? this.color,
      serverTimestamp: serverTimestamp ?? this.serverTimestamp,
    );
  }

  factory TodoModel.fromFirestore(
      QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    return TodoModel.fromMap(doc.data()).copyWith(id: doc.id);
  }

  Todo toDomain() {
    return Todo(id: UniqueID.fromUniqueString(id),
        title: title,
        body: body,
        done: done,
        color: TodoColor(color: Color(color).withOpacity(1)));
  }

  factory TodoModel.fromDomain(Todo todoItem) {
    return TodoModel(serverTimestamp: FieldValue.serverTimestamp(),
        id: todoItem.id.value,
        title: todoItem.title,
        body: todoItem.body,
        done: todoItem.done,
        color: todoItem.color.color.value);
  }
}
