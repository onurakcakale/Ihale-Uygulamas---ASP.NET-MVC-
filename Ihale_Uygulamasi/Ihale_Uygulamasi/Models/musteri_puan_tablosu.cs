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
    
    public partial class musteri_puan_tablosu
    {
        public int id { get; set; }
        public int puan_veren_id { get; set; }
        public string puan_veren_kullanici { get; set; }
        public int musteri_id { get; set; }
        public string musteri_adi { get; set; }
        public string musteri_soyadi { get; set; }
        public float puan { get; set; }
    }
}
