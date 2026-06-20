-- ============================================================
--  IZIN AKSES ADMIN — jalankan di Supabase > SQL Editor > Run
--  Membuat halaman admin (setelah LOGIN) bisa menambah, mengubah,
--  menyembunyikan, dan menghapus artikel.
--
--  Aman: publik (anon) tetap HANYA bisa membaca artikel yang tayang.
--  Penulisan hanya bisa oleh user yang sudah login (authenticated).
-- ============================================================

alter table public.published_news enable row level security;

-- Admin (login) boleh melihat SEMUA artikel, termasuk yang disembunyikan.
drop policy if exists "admin lihat semua" on public.published_news;
create policy "admin lihat semua"
  on public.published_news for select
  to authenticated using (true);

-- Admin boleh menambah artikel.
drop policy if exists "admin tambah" on public.published_news;
create policy "admin tambah"
  on public.published_news for insert
  to authenticated with check (true);

-- Admin boleh mengubah (mis. sembunyikan / tampilkan).
drop policy if exists "admin ubah" on public.published_news;
create policy "admin ubah"
  on public.published_news for update
  to authenticated using (true) with check (true);

-- Admin boleh menghapus.
drop policy if exists "admin hapus" on public.published_news;
create policy "admin hapus"
  on public.published_news for delete
  to authenticated using (true);

-- Catatan: kebijakan baca-publik "baca publik berita tayang" dari supabase_setup.sql
-- tetap berlaku berdampingan. Tidak perlu dihapus.
