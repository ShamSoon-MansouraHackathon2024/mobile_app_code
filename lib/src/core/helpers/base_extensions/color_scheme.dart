import 'package:flutter/material.dart';

extension ColorSchemeFallback on ColorScheme {
  Color get surfaceContainerHighest =>
      surfaceVariant; // Use an existing color as a fallback
}