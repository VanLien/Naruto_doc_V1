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
          "order": [[ 2, "desc" ]],
          "ajax": "/@trachntn/api/getUserData.php",
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

  

});
  
  </script>  

<div class="container-fluid">

      

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">User Management</h6>
            </div>
            <div class="card-body">
            <div class="table-responsive">  
<table id="memListTable" class="table table-striped table-bordered" style="width:100%">
                          <thead>  
                               <tr>  
									<th width="10%">ID</th>
                                    <th width="10%">Username</th>                                   
									<th width="10%">Mật Khẩu</th>
                                    <th width="10%">Xu</th>
                                    <th width="10%">Xu (locked)</th>
                                    <th width="10%">IP</th>
                                    
                                    <th width="10%">Email</th>
                                    <th width="10%">Created at</th>
                                      <th width="10%">Action</th>

                               </tr>  
                          </thead>  
                              
</table>  
</div>
            </div>
          </div>

        </div>


