﻿//------------------------------------------------------------------------------
// <auto-generated>
//    Bu kod bir şablondan oluşturuldu.
//
//    Bu dosyada el ile yapılan değişiklikler uygulamanızda beklenmedik davranışa neden olabilir.
//    Kod yeniden oluşturulursa, bu dosyada el ile yapılan değişikliklerin üzerine yazılacak.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Ihale_Uygulamasi.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class ihale_uygulamasiEntities : DbContext
    {
        public ihale_uygulamasiEntities()
            : base("name=ihale_uygulamasiEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<admin_tablosu> admin_tablosu { get; set; }
        public DbSet<ihale_hareket_tablosu> ihale_hareket_tablosu { get; set; }
        public DbSet<ihale_tablosu> ihale_tablosu { get; set; }
        public DbSet<kategori_tablosu> kategori_tablosu { get; set; }
        public DbSet<mesaj_tablosu> mesaj_tablosu { get; set; }
        public DbSet<musteri_puan_tablosu> musteri_puan_tablosu { get; set; }
        public DbSet<musteri_tablosu> musteri_tablosu { get; set; }
        public DbSet<puan_tablosu> puan_tablosu { get; set; }
        public DbSet<ihale_hareket_view> ihale_hareket_view { get; set; }
        public DbSet<ihale_tablosu_view> ihale_tablosu_view { get; set; }
        public DbSet<ilanlarim_tablosu_view> ilanlarim_tablosu_view { get; set; }
        public DbSet<mesajlar_view> mesajlar_view { get; set; }
        public DbSet<teklif_verenler_view> teklif_verenler_view { get; set; }
    }
}