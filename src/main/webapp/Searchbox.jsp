<%-- 
    Document   : Searchbox
    Created on : Dec 22, 2021, 8:21:04 PM
    Author     : The Bigger
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">SEARCH HERE</h4>
				</div>
				<div class="modal-body">
					<div class="input-group">
                                            <form method="get" action="search.jsp" class="searchform" role="search">
							<input type="text" name="tensp" class="form-control control-search">
							<span class="input-group-btn">
								<button class="btn btn-default button_search" type="submit"><i class="ion-ios-search"></i></button>
							</span>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
