namespace API.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class InvigilatorAvailableDate
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public InvigilatorAvailableDate()
        {
            ClassTestDates = new HashSet<ClassTestDateModel>();
        }

        public int InvigilatorAvailableDateId { get; set; }

        public int InvigilatorID { get; set; }

        public DateTime InvigilatorAvailDate { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ClassTestDateModel> ClassTestDates { get; set; }

        public virtual InvigilatorModel Invigilator { get; set; }
    }
}
