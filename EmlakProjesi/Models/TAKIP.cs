namespace EmlakProjesi.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TAKIP")]
    public partial class TAKIP
    {
        public int ID { get; set; }

        public int? UYE_ID { get; set; }

        public int IL_ID { get; set; }

        public int ILCE_ID { get; set; }

        [StringLength(200)]
        public string DETAY { get; set; }

        [StringLength(50)]
        public string KOORDINAT_X { get; set; }

        [StringLength(50)]
        public string KOORDINAT_Y { get; set; }

        public bool? AKTIF { get; set; }

        public virtual IL IL { get; set; }

        public virtual ILCE ILCE { get; set; }
    }
}
