<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>K-STUDY</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="../resources/assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../resources/css/styles.css" rel="stylesheet" />
</head>
<body>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="#!">K-STUDY</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#!">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#!">About</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#!">All Products</a></li>
							<li><hr class="dropdown-divider" /></li>
							<li><a class="dropdown-item" href="#!">Popular Items</a></li>
							<li><a class="dropdown-item" href="#!">New Arrivals</a></li>
						</ul></li>
				</ul>
				<form class="d-flex">
					<button class="btn btn-outline-dark" type="submit">
						<i class="bi-cart-fill me-1"></i> Cart <span
							class="badge bg-dark text-white ms-1 rounded-pill">0</span>
					</button>
				</form>
			</div>
		</div>
	</nav>
	<!-- Header-->
	<header class="bg-dark py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="text-center text-white">
				<h1 class="display-4 fw-bolder">K-STUDY</h1>
				<p class="lead fw-normal text-white-50 mb-0">K-MOOC 온라인 스터디 홈페이지</p>
			</div>
		</div>
	</header>

	<!-- Menu Bar -->	
	<div class="bs-docs-section clearfix">
        <div class="row"> <!-- padding-top 수정 -->
          <div class="col-lg-13">
            <div class="bs-component">
              <nav class="navbar navbar-expand-lg navbar-dark bg-primary2">
                <div class="container-fluid">
                  <a class="navbar-brand" href="#">전체강의</a>
                  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                  </button>

                  <div class="collapse navbar-collapse" id="navbarColor01">
                    <ul class="navbar-nav me-auto">
                      <li class="nav-item">
                        <a class="nav-link active" href="#">Home
                          <span class="visually-hidden">(current)</span>
                        </a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#">Features</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#">Pricing</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#">About</a>
                      </li>
                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Dropdown</a>
                        <div class="dropdown-menu">
                          <a class="dropdown-item" href="#">Action</a>
                          <a class="dropdown-item" href="#">Another action</a>
                          <a class="dropdown-item" href="#">Something else here</a>
                          <div class="dropdown-divider"></div>
                          <a class="dropdown-item" href="#">Separated link</a>
                        </div>
                      </li>
                    </ul>
                    <form class="d-flex">
                      <input class="form-control me-sm-2" type="text" placeholder="Search">
                      <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
                    </form>
                  </div>
                </div>
              </nav>
            </div>
          </div>
        </div>
      </div>
	
	<!-- Section-->
	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top"
							src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">Fancy Product</h5>
								<!-- Product price-->
								$40.00 - $80.00
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">View
									options</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Sale badge-->
						<div class="badge bg-dark text-white position-absolute"
							style="top: 0.5rem; right: 0.5rem">Sale</div>
						<!-- Product image-->
						<img class="card-img-top"
							src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">Special Item</h5>
								<!-- Product reviews-->
								<div
									class="d-flex justify-content-center small text-warning mb-2">
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
								</div>
								<!-- Product price-->
								<span class="text-muted text-decoration-line-through">$20.00</span>
								$18.00
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Sale badge-->
						<div class="badge bg-dark text-white position-absolute"
							style="top: 0.5rem; right: 0.5rem">Sale</div>
						<!-- Product image-->
						<img class="card-img-top"
							src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">Sale Item</h5>
								<!-- Product price-->
								<span class="text-muted text-decoration-line-through">$50.00</span>
								$25.00
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top"
							src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">Popular Item</h5>
								<!-- Product reviews-->
								<div
									class="d-flex justify-content-center small text-warning mb-2">
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
								</div>
								<!-- Product price-->
								$40.00
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Sale badge-->
						<div class="badge bg-dark text-white position-absolute"
							style="top: 0.5rem; right: 0.5rem">Sale</div>
						<!-- Product image-->
						<img class="card-img-top"
							src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">Sale Item</h5>
								<!-- Product price-->
								<span class="text-muted text-decoration-line-through">$50.00</span>
								$25.00
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top"
							src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">Fancy Product</h5>
								<!-- Product price-->
								$120.00 - $280.00
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">View
									options</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Sale badge-->
						<div class="badge bg-dark text-white position-absolute"
							style="top: 0.5rem; right: 0.5rem">Sale</div>
						<!-- Product image-->
						<img class="card-img-top"
							src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">Special Item</h5>
								<!-- Product reviews-->
								<div
									class="d-flex justify-content-center small text-warning mb-2">
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
								</div>
								<!-- Product price-->
								<span class="text-muted text-decoration-line-through">$20.00</span>
								$18.00
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top"
							src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">Popular Item</h5>
								<!-- Product reviews-->
								<div
									class="d-flex justify-content-center small text-warning mb-2">
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
								</div>
								<!-- Product price-->
								$40.00
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
							</div>
						</div>
					</div>
				</div>
				
				<div>
				  <ul class="pagination">
				    <li class="page-item disabled">
				      <a class="page-link" href="#">&laquo;</a>
				    </li>
				    <li class="page-item active">
				      <a class="page-link" href="#">1</a>
				    </li>
				    <li class="page-item">
				      <a class="page-link" href="#">2</a>
				    </li>
				    <li class="page-item">
				      <a class="page-link" href="#">3</a>
				    </li>
				    <li class="page-item">
				      <a class="page-link" href="#">4</a>
				    </li>
				    <li class="page-item">
				      <a class="page-link" href="#">5</a>
				    </li>
				    <li class="page-item">
				      <a class="page-link" href="#">&raquo;</a>
				    </li>
				  </ul>
				</div>
							
			</div>
		</div>
	</section>
	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; K-STUDY
				2021</p>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="../resources/js/scripts.js"></script>
</body>
</html>
