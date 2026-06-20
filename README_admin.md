# Halaman Admin — Input Artikel Tanpa Buka Supabase

Folder ini berisi:
- **`admin.html`** — halaman admin dengan form input artikel + login.
- **`admin_setup.sql`** — izin akses agar admin bisa menulis/menghapus.

Halaman admin aman: hanya bisa dipakai setelah **login**. Publik tetap hanya bisa membaca.

---

## Langkah 1 — Jalankan izin akses (sekali saja)

1. Buka **Supabase → SQL Editor → New query**.
2. Salin isi `admin_setup.sql`, tempel, klik **Run**.

> Jika tabel `published_news` belum dibuat, jalankan dulu `supabase_setup.sql`.

## Langkah 2 — Buat akun admin

1. Buka **Supabase → Authentication → Users → Add user → Create new user**.
2. Isi **email** dan **password** yang kamu mau (ini jadi login admin-mu).
3. Centang **Auto Confirm User** (supaya tak perlu verifikasi email). Simpan.

**Penting — matikan pendaftaran publik** supaya tak ada orang lain bisa bikin akun:
- **Authentication → Sign In / Providers → Email** → matikan **Allow new users to sign up** (atau "Enable sign-ups"). Simpan.

Dengan ini, hanya akun yang kamu buat manual yang bisa login.

## Langkah 3 — Unggah `admin.html`

1. Taruh `admin.html` di repo `deficryptomedia-web` (folder yang sama dengan `index.html`).
2. Commit. Halaman akan tersedia di:
   **`https://asetkeuangandigital.id/admin.html`**

> File sudah diset `noindex` agar tidak muncul di Google. Tetap simpan baik-baik alamatnya.
> (Alternatif: jangan unggah ke GitHub — cukup buka `admin.html` dari komputermu. Tetap berfungsi karena terhubung ke Supabase.)

---

## Cara Pakai Sehari-hari

1. Buka `asetkeuangandigital.id/admin.html`.
2. **Masuk** dengan email & password admin.
3. Isi form: kategori, judul, ringkasan, isi, sumber, link. Centang **LIVE** bila breaking.
4. Klik **Terbitkan artikel**. Artikel muncul di situs dalam ≤3 menit.
5. Di daftar bawah, kamu bisa **Sembunyikan/Tampilkan** atau **Hapus** artikel kapan saja.

## Keamanan — yang perlu diingat

- `admin.html` hanya memuat **anon key** (sama seperti `index.html`) — ini memang aman dipublikasikan.
- Yang melindungi data adalah **login** + kebijakan akses (RLS). Tanpa login, form tak bisa menyimpan apa pun.
- **Jangan pernah** menaruh `service_role key` di `admin.html` atau file mana pun yang diunggah ke web.
- Gunakan password admin yang kuat & unik.
