<?php
if(!isset($_SESSION['admin'])){
  exit;
}
?>
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>  
<script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>            
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css" /> 
<script>
  $(document).ready(function() {
    var dataTable = $('#memListTable').DataTable({
          "processing": true,
          "serverSide": true,
          "order": [[ 6, "desc" ]],
          "ajax": "/@trachntn/api/getNewsList.php",
          // thêm db vào column tùy chọn
          // "columnDefs": [ 
          //       {
          //           // The `data` parameter refers to the data for the cell (defined by the
          //           // `data` option, which defaults to the column being worked with, in

          //           "render": function ( data, type, row ) {
          //               return data + row[6];
          //           },
          //           "targets": 2
          //       },
          //       //This is makes db 16 row nonvisible
          //        { "visible": false,  "targets": [ 6 ] }
          //   ],
      });

    
   

    $(document).on('click', '.delete_btn', function() {
        var pid = $(this).attr("id");
        var action = $(this).attr("name");
      $.post('api/AjaxNews.php', {
              pid: pid, action: action
          }, function(result) {
              if (result.status) {
                  alert(result.msg);
                  dataTable.ajax.reload();
              } else {
                  alert(result.msg);

              }
          },
          'JSON'
      );
    });
  });
  </script>  

<div class="container-fluid">

      

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">News Management</h6>
            </div>
            <div class="card-body">
            <div class="table-responsive">  
<table id="memListTable" class="table table-striped table-bordered" style="width:100%">
                          <thead>  
                               <tr>  
                                    <th>ID</th>
                                    <th>Title</th>
                                    <th>Type</th>
                                    <th>Thumbnail</th>
                                    <th>Content</th>
                                    <th width="15%">Manager</th>
                                    <th width="15%">Time</th>
                               </tr>  
                          </thead>  
                             
                    </tr>
                </tfoot>
</table>  
</div>
            </div>
          </div>

        </div>


