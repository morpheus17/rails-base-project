<% cname = @market_quote.company_name.split(/\s|\./)[0]%>
    <% image_url = "https://logo.clearbit.com/"+cname+".com" %>

    <div class="d-flex justify-content-between mb-3">
      <h5 class="modal-title" id="exampleModalLabel">Remove Stock from Watch List</h5>
      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
    </div>
    <div class="row d-flex justify-content-between card-header-watchlist mb-3">
      <div class="col-2">
          <img src='<%= image_url %>' class="img-fluid border-0 rounded-3" alt="company_logo">
      </div>
      <div class="col">
        <h5 class="card-title"><%= @market_quote.symbol %></h5>
        <h6 class="card-subtitle mb-2 text-muted"><%= @market_quote.company_name %></h6>
      </div>
    </div>
  </div>
  <div class="modal-footer border-0">
    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
    <%= f.button "Checkout", class: "btn btn-primary",
      data: {disable_with: "<span class='spinner-border spinner-border-sm' role='status' aria-hidden='true'></span> Processing..."} %>
  
    <%= button_to "Remove", show_stock_in_modal_path, method: :post, remote: true,
        class: "btn btn-danger",
        data: {disable_with: "<span class='spinner-border spinner-border-sm' role='status' aria-hidden='true'></span> Removing..."},
        params: { } %>