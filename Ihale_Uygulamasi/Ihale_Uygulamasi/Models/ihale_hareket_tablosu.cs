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
    
    public partial class ihale_hareket_tablosu
    {
        public int id { get; set; }
        public int ihale_id { get; set; }
        public int musteri_id { get; set; }
        public float teklif_fiyati { get; set; }
        public int aktif { get; set; }
    
        public virtual ihale_tablosu ihale_tablosu { get; set; }
    }
}