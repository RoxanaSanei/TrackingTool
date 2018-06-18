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
            ClassTestDates = new HashSet<ClassTestDate>();
        }

        public int InvigilatorAvailableDateId { get; set; }

        public int InvigilatorID { get; set; }

        public DateTime InvigilatorAvailDate { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ClassTestDate> ClassTestDates { get; set; }

        public virtual Invigilator Invigilator { get; set; }
    }
}
