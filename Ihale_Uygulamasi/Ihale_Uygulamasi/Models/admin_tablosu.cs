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
    using System.ComponentModel.DataAnnotations;
    
    public partial class admin_tablosu
    {
        public int id { get; set; }

        [Required(ErrorMessage = "Lüfen kullanıcı adınızı giriniz.")]
        public string kullanici_adi { get; set; }

        [Required(ErrorMessage = "Lüfen şifrenizi giriniz.")]
        public string sifre { get; set; }
        public Nullable<sbyte> rol { get; set; }

        public virtual bool BeniHatirla { get; set; }
    }
}
