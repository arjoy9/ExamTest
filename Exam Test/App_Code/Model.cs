﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;

public partial class Comment
{
    public int CommentsID { get; set; }
    public string CommentsUser { get; set; }
    public Nullable<System.DateTime> CommentsDateTime { get; set; }
    public Nullable<int> PostID { get; set; }
    public string CommentsText { get; set; }
    public Nullable<int> CommentsLike { get; set; }
    public Nullable<int> CommentsDisLike { get; set; }
}

public partial class PostTable
{
    public int PostID { get; set; }
    public string PostUser { get; set; }
    public Nullable<System.DateTime> PostDateTime { get; set; }
    public string PostName { get; set; }
}
