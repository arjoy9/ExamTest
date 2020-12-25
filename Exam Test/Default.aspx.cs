using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        
       
    }
    public class CommentsViewModel
    {
        public int CommentsID { get; set; }
        public int? PostID { get; set; }
        public string CommentsText { get; set; }
        public string CommentsUser { get; set; }
        public string CommentsDate { get; set; }
        public int? CommentsLike { get; set; }
        public int? CommentsDisLike { get; set; }

    }

    public class PostVM {
        public int PostID { get; set; }
        public string PostName { get; set; }
        public string PostUser { get; set; }
        public string PDate { get; set; }
        public int? TotalComments { get; set; }

        public List<CommentsViewModel> cvm { get; set; }

    }

    [WebMethod]
    public static List<PostVM> GetAllPost()
    {
        POSTDBEntities db = new POSTDBEntities();
        List<PostVM> p = new List<PostVM>();

        var result = (from postt in db.PostTables
                      select new
                      {
                          postt.PostID,
                          postt.PostName,
                          postt.PostDateTime,
                          postt.PostUser
                      }).ToList().Select(d=>
                       new
                      {
                          d.PostID,
                          d.PostName,
                          d.PostUser,
                          PDate = Convert.ToDateTime(d.PostDateTime).ToString("dd/MM/yyyy")

                      }).ToList();

        

        foreach (var item in result)
        {
            PostVM pvm = new PostVM();
            pvm.PostID = item.PostID;
            pvm.PostName = item.PostName;
            pvm.PDate = item.PDate;
            pvm.PostUser = item.PostUser;
            
            var commentsd = (from comm in db.Comments
                             select new
                             {
                                 comm.CommentsID,
                                 comm.CommentsText,
                                 comm.CommentsUser,
                                 comm.CommentsDateTime,
                                 comm.PostID,
                                 comm.CommentsLike,
                                 comm.CommentsDisLike
                             }).Where(d => d.PostID == item.PostID).ToList().Select(d =>
                                  new
                                  {
                                      d.CommentsID,
                                      d.CommentsText,
                                      d.CommentsUser,
                                      CommentsDate = Convert.ToDateTime(d.CommentsDateTime).ToString("dd/MM/yyyy"),
                                      d.PostID,
                                      d.CommentsLike,
                                      d.CommentsDisLike

                                  }).ToList();
            List<CommentsViewModel> cvmv = new List<CommentsViewModel>();
            foreach (var item2 in commentsd)
            {
                CommentsViewModel cv = new CommentsViewModel();
                cv.CommentsID = item2.CommentsID;
                cv.CommentsText = item2.CommentsText;
                cv.CommentsUser = item2.CommentsUser;
                cv.CommentsDate = item2.CommentsDate;
                cv.PostID = item2.PostID;
                cv.CommentsLike = item2.CommentsLike;
                cv.CommentsDisLike = item2.CommentsDisLike;
                cvmv.Add(cv);
            }
            pvm.TotalComments = commentsd.Count;
            pvm.cvm = cvmv;
            p.Add(pvm);

        }

        return p;
    }
    [WebMethod]
    public static List<PostVM>  LikeDisLike(int CommentsID, string LikeDisLike)
    {

        POSTDBEntities db = new POSTDBEntities();
        if (LikeDisLike == "Like")
        {
            var lddb = db.Comments.Where(d => d.CommentsID == CommentsID).FirstOrDefault();
            lddb.CommentsLike = lddb.CommentsLike + 1;
            db.SaveChanges();
        }
        else
        {

            var lddb = db.Comments.Where(d => d.CommentsID == CommentsID).FirstOrDefault();
            lddb.CommentsDisLike = lddb.CommentsDisLike + 1;
            db.SaveChanges();
        }
        List<PostVM> p = new List<PostVM>();

        var result = (from postt in db.PostTables
                      select new
                      {
                          postt.PostID,
                          postt.PostName,
                          postt.PostDateTime,
                          postt.PostUser
                      }).ToList().Select(d =>
                       new
                       {
                           d.PostID,
                           d.PostName,
                           d.PostUser,
                           PDate = Convert.ToDateTime(d.PostDateTime).ToString("dd/MM/yyyy")

                       }).ToList();



        foreach (var item in result)
        {
            PostVM pvm = new PostVM();
            pvm.PostID = item.PostID;
            pvm.PostName = item.PostName;
            pvm.PDate = item.PDate;
            pvm.PostUser = item.PostUser;

            var commentsd = (from comm in db.Comments
                             select new
                             {
                                 comm.CommentsID,
                                 comm.CommentsText,
                                 comm.CommentsUser,
                                 comm.CommentsDateTime,
                                 comm.PostID,
                                 comm.CommentsLike,
                                 comm.CommentsDisLike
                             }).Where(d => d.PostID == item.PostID).ToList().Select(d =>
                                  new
                                  {
                                      d.CommentsID,
                                      d.CommentsText,
                                      d.CommentsUser,
                                      CommentsDate = Convert.ToDateTime(d.CommentsDateTime).ToString("dd/MM/yyyy"),
                                      d.PostID,
                                      d.CommentsLike,
                                      d.CommentsDisLike

                                  }).ToList();
            List<CommentsViewModel> cvmv = new List<CommentsViewModel>();
            foreach (var item2 in commentsd)
            {
                CommentsViewModel cv = new CommentsViewModel();
                cv.CommentsID = item2.CommentsID;
                cv.CommentsText = item2.CommentsText;
                cv.CommentsUser = item2.CommentsUser;
                cv.CommentsDate = item2.CommentsDate;
                cv.PostID = item2.PostID;
                cv.CommentsLike = item2.CommentsLike;
                cv.CommentsDisLike = item2.CommentsDisLike;
                cvmv.Add(cv);
            }
            pvm.TotalComments = commentsd.Count;
            pvm.cvm = cvmv;
            p.Add(pvm);

        }

        return p;
    }
}