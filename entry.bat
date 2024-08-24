cd lib
mkdir config
mkdir config\constant
mkdir config\router
set x=x > config\router\app_router.dart
> config\router\app_router.dart (
echo import 'package:go_router/go_router.dart';
echo // import 'ruta donde esta el HomeScreen';
echo.
echo final appRouter = GoRouter^(
echo   routes: ^[
echo     GoRoute^(
echo       path: '/', //ruta raiz donde esta el home
echo       builder: ^(context, state^) ^=^> const HomeScreen^(^),
echo     ^),
echo   ^],
echo ^);
)
md config\themes
set x=x > config\themes\app_theme.dart

> config\themes\app_theme.dart (
echo import 'package:flutter/material.dart';
echo.
echo class AppTheme^{
echo   ThemeData getTheme^(^) ^=^> ThemeData^(
echo     colorSchemeSeed : const Color^(0xFF2862F5^)
echo     ^);
echo ^}
)

md domain
md domain\datasource
md domain\entities
md domain\repositories

md infrastructure
md infrastructure\datasource
md infrastructure\mappers
md infrastructure\models
md infrastructure\repositories

md presentation
md presentation\providers
md presentation\screens

set x=x > presentation\screens\home_screen.dart

> presentation\screens\home_screen.dart (

echo import 'package:flutter/material.dart';
echo. 
echo. 
echo class HomeScreen extends StatelessWidget ^{
echo   const HomeScreen^(^{super.key^}^);
echo. 
echo   @override
echo   Widget build^(BuildContext context^) ^{
echo     return Scaffold^(
echo       appBar: AppBar^(
echo         title: const Text^('Hola Mundo'^),
echo         centerTitle: true,
echo       ^),
echo       body: const Placeholder^(^)
echo     ^);
echo   ^}
echo ^}
)

del .\lib\main.dart

set x=x > .\main.dart

> .\main.dart (
echo import //'ruta del app_router';
echo import //'ruta del app_theme.dart';
echo import 'package:flutter/material.dart';
echo. 
echo void main^(^) ^{
echo   runApp^(const MainApp^(^)^);
echo ^}
echo. 
echo class MainApp extends StatelessWidget ^{
echo   const MainApp^(^{super.key^}^);
echo. 
echo   @override
echo   Widget build^(BuildContext context^) ^{
echo     return  MaterialApp.router^(
echo       routerConfig: appRouter,
echo       debugShowCheckedModeBanner: false,
echo       theme: AppTheme^(^).getTheme^(^),
echo     ^);
echo   ^}
echo ^}

)
