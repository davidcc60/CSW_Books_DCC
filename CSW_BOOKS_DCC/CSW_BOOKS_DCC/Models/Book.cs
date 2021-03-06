//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CSW_BOOKS_DCC.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Book
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Book()
        {
            this.Rel_BookAuthor = new HashSet<Rel_BookAuthor>();
            this.Rel_BookCategory = new HashSet<Rel_BookCategory>();
        }
    
        public string ISBN { get; set; }
        public string Title { get; set; }
        public int Year { get; set; }
        public int Edition { get; set; }
        public int IdPublisher { get; set; }
        public string Img { get; set; }
    
        public virtual Publisher Publisher { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Rel_BookAuthor> Rel_BookAuthor { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Rel_BookCategory> Rel_BookCategory { get; set; }
    }
}
