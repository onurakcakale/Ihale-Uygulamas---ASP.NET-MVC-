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
    
    public partial class mesajlar_view
    {
        public int mesaj_id { get; set; }
        public int gonderen_id { get; set; }
        public string gonderen_adi { get; set; }
        public string gonderen_soyadi { get; set; }
        public int alici_id { get; set; }
        public Nullable<int> ihale_id { get; set; }
        public string urun_adi { get; set; }
        public string mesaj { get; set; }
        public Nullable<int> mesaj_cevap_id { get; set; }
        public long yanit { get; set; }
    }
}
