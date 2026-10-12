# CATÁLOGO MAXIGAFAS + SUPABASE

Esta versión conserva el diseño del catálogo y reemplaza IndexedDB por Supabase.

## 1. Configuración de Supabase

El frontend usa:
- Project URL: `https://uogzajftwsbpksxycqxg.supabase.co`
- Publishable key: la clave pública configurada en `app.js`.

Nunca colocar una `sb_secret_...` en el frontend.

## 2. Ejecutar SQL de permisos

En Supabase > SQL Editor, ejecutar una vez:

`SUPABASE-SETUP-ADMIN.sql`

El archivo agrega los campos de recorte y las políticas RLS para que únicamente el UID administrador pueda escribir.

## 3. Autenticación

El botón ADMINISTRADOR utiliza Supabase Auth. El campo USUARIO debe recibir el correo del usuario administrador creado en Authentication > Users y la contraseña correspondiente.

No se guarda la contraseña en el código.

## 4. Imágenes

Las imágenes se suben al bucket público `productos`.
Cada producto puede tener máximo 3 imágenes.
Las fotos originales se conservan en Storage; el recorte es solo CSS y sus valores se guardan en `product_images.preview_x`, `preview_y` y `preview_zoom`.

## 5. GitHub Pages

Subir el contenido de esta carpeta al repositorio de GitHub Pages. No se necesita Node ni un servidor propio para el frontend.
