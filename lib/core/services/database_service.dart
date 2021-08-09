import 'dart:async';

import 'package:book_medial/core/models/session_models.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  Future<Database> setupdatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    // Open the database and store the reference.
    final database = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), 'book_medial_database.db'),

      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          'CREATE TABLE sessions(key TEXT PRIMARY KEY, value TEXT)',
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );

    return database;
  }

  Future<void> setItem(String key, value) async {
    this.setupdatabase();
    // Get a reference to the database.
    final db = await this.setupdatabase();

    SessionModels sessions = new SessionModels(key: key, value: value);

    if (await this.getItem(key) != null) {
      await this.updateSession(sessions);
    } else {
      // Insert the Dog into the correct table. You might also specify the
      // `conflictAlgorithm` to use in case the same dog is inserted twice.
      //
      // In this case, replace any previous data.
      await db.insert(
        'sessions',
        sessions.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<dynamic> getItem(String key) async {
    // Get a reference to the database.
    final db = await this.setupdatabase();

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('sessions');
    //print(maps);
    // Convert the List<Map<String, dynamic> into a List<Dog>.
    List<SessionModels> sessionList = List.generate(maps.length, (i) {
      return SessionModels.fromJson(maps[i]);
    });

    var value;

    for (var sess in sessionList) {
      if (sess.key == key) value = sess.value;
    }
    return value;
  }

  Future<void> updateSession(SessionModels session) async {
    // Get a reference to the database.
    final db = await this.setupdatabase();

    // Update the given Dog.
    await db.update(
      'sessions',
      session.toMap(),
      // Ensure that the Dog has a matching id.
      where: 'key = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [session.key],
    );
  }

  Future<void> clear() async {
    final db = await this.setupdatabase();

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('sessions');

    for (var map in maps) {
      await db.delete(
        'sessions',
        // Use a `where` clause to delete a specific dog.
        where: 'key = ?',
        // Pass the Dog's id as a whereArg to prevent SQL injection.
        whereArgs: [map["key"]],
      );
    }
  }

  Future<void> deleteItem(String key) async {
    // Get a reference to the database.
    final db = await this.setupdatabase();

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('sessions');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    List<SessionModels> sessionList = List.generate(maps.length, (i) {
      return SessionModels.fromJson(maps[i]);
    });

    for (var sess in sessionList) {
      if (sess.key == key) {
        await db.delete(
          'sessions',
          // Use a `where` clause to delete a specific dog.
          where: 'key = ?',
          // Pass the Dog's id as a whereArg to prevent SQL injection.
          whereArgs: [key],
        );
      }
    }
  }
}
