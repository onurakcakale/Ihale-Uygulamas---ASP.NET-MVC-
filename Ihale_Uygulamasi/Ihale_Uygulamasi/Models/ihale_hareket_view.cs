//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class ihale_hareket_view
    {
        public int ihale_id { get; set; }
        public int musteri_id { get; set; }
        public string musteri_adi { get; set; }
        public string musteri_soyadi { get; set; }
        public double puan { get; set; }
        public string firma_adi { get; set; }
        public string e_posta { get; set; }
        public string urun_fotografi { get; set; }
        public int urun_kategorisi { get; set; }
        public string urun_adi { get; set; }
        public string aciklama { get; set; }
        public int stok_adet { get; set; }
        public System.DateTime baslangic_tarihi { get; set; }
        public System.DateTime bitis_tarihi { get; set; }
        public int aktif { get; set; }
        public float teklif_fiyati { get; set; }
    }
}
