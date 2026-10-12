-- MAXIGAFAS - PERMISOS DEL ADMINISTRADOR
-- UID DEL ADMINISTRADOR:
-- 39d58d6f-375b-4fe3-897c-9098418dd0f4
--
-- Ejecutar UNA SOLA VEZ en Supabase > SQL Editor.


-- 0) Asegurar las subcategorías iniciales del catálogo.
insert into public.subcategories (category_id, name, display_order)
select c.id, v.name, v.ord
from public.categories c
join (values
  ('MONTURAS ACETATO', 1),
  ('MONTURAS PASTA', 2),
  ('MONTURAS PASTA INYECTADA', 3),
  ('MONTURAS TR-90', 4),
  ('MONTURAS METAL', 5),
  ('MONTURAS MARCAS PROPIAS', 6)
) as v(name, ord) on c.name = 'MONTURAS'
on conflict (category_id, name) do nothing;

-- 1) Guardamos el recorte de previsualización por fotografía.
alter table public.product_images
  add column if not exists preview_x numeric not null default 0,
  add column if not exists preview_y numeric not null default 50,
  add column if not exists preview_zoom numeric not null default 1.55;

-- 2) Políticas de escritura para PRODUCTS.
create policy "Admin can insert products"
on public.products
for insert
to authenticated
with check ((select auth.uid()) = '39d58d6f-375b-4fe3-897c-9098418dd0f4'::uuid);

create policy "Admin can update products"
on public.products
for update
to authenticated
using ((select auth.uid()) = '39d58d6f-375b-4fe3-897c-9098418dd0f4'::uuid)
with check ((select auth.uid()) = '39d58d6f-375b-4fe3-897c-9098418dd0f4'::uuid);

create policy "Admin can delete products"
on public.products
for delete
to authenticated
using ((select auth.uid()) = '39d58d6f-375b-4fe3-897c-9098418dd0f4'::uuid);

-- 3) Políticas de escritura para PRODUCT_IMAGES.
create policy "Admin can insert product images"
on public.product_images
for insert
to authenticated
with check ((select auth.uid()) = '39d58d6f-375b-4fe3-897c-9098418dd0f4'::uuid);

create policy "Admin can update product images rows"
on public.product_images
for update
to authenticated
using ((select auth.uid()) = '39d58d6f-375b-4fe3-897c-9098418dd0f4'::uuid)
with check ((select auth.uid()) = '39d58d6f-375b-4fe3-897c-9098418dd0f4'::uuid);

create policy "Admin can delete product image rows"
on public.product_images
for delete
to authenticated
using ((select auth.uid()) = '39d58d6f-375b-4fe3-897c-9098418dd0f4'::uuid);

-- 4) Opcional pero recomendado: el administrador también podrá mantener
-- marcas, categorías y subcategorías desde una futura pantalla de configuración.
create policy "Admin can insert brands"
on public.brands
for insert
to authenticated
with check ((select auth.uid()) = '39d58d6f-375b-4fe3-897c-9098418dd0f4'::uuid);

create policy "Admin can update brands"
on public.brands
for update
to authenticated
using ((select auth.uid()) = '39d58d6f-375b-4fe3-897c-9098418dd0f4'::uuid)
with check ((select auth.uid()) = '39d58d6f-375b-4fe3-897c-9098418dd0f4'::uuid);

create policy "Admin can delete brands"
on public.brands
for delete
to authenticated
using ((select auth.uid()) = '39d58d6f-375b-4fe3-897c-9098418dd0f4'::uuid);

create policy "Admin can insert categories"
on public.categories
for insert
to authenticated
with check ((select auth.uid()) = '39d58d6f-375b-4fe3-897c-9098418dd0f4'::uuid);

create policy "Admin can update categories"
on public.categories
for update
to authenticated
using ((select auth.uid()) = '39d58d6f-375b-4fe3-897c-9098418dd0f4'::uuid)
with check ((select auth.uid()) = '39d58d6f-375b-4fe3-897c-9098418dd0f4'::uuid);

create policy "Admin can delete categories"
on public.categories
for delete
to authenticated
using ((select auth.uid()) = '39d58d6f-375b-4fe3-897c-9098418dd0f4'::uuid);

create policy "Admin can insert subcategories"
on public.subcategories
for insert
to authenticated
with check ((select auth.uid()) = '39d58d6f-375b-4fe3-897c-9098418dd0f4'::uuid);

create policy "Admin can update subcategories"
on public.subcategories
for update
to authenticated
using ((select auth.uid()) = '39d58d6f-375b-4fe3-897c-9098418dd0f4'::uuid)
with check ((select auth.uid()) = '39d58d6f-375b-4fe3-897c-9098418dd0f4'::uuid);

create policy "Admin can delete subcategories"
on public.subcategories
for delete
to authenticated
using ((select auth.uid()) = '39d58d6f-375b-4fe3-897c-9098418dd0f4'::uuid);
