<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Debug="true" Inherits="SiteSiraBulucu.Default" %>

<!doctype html>
<html lang="tr">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Site Sıra Bulucu. Kelime bazlı aramalarda sitenizin kaçıncı sırada olduğunu öğrenebilirsiniz.">
    <meta name="author" content="Muhammet Kirazoğlu">

    <title>Site Sıra Bulucu | Muhammet Kirazoğlu</title>
    <link href="Assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Assets/css/common.css" rel="stylesheet" />


    <link href="Assets/css/theme-01.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700&amp;display=swap" rel="stylesheet">
</head>

<body>
    <div class="forny-container">

        <div class="forny-inner">

            <div class="alert alert-danger d-none alert-form-error">
                Lütfen bilgileri doğru ve eksiksiz giriniz.
    <button type="button" class="close" data-dismiss="alert" aria-label="Kapat">
        <span aria-hidden="true">&times;</span>
    </button>
            </div>


            <div class="forny-form">
                <div class="forny-logo" style="color: slategray">
                    <h2>Site Sıra Bulucu</h2>
                </div>
                <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active bg-transparent" href="#login" data-toggle="tab" role="tab">
                            <span>Lütfen aşağıdaki alanları doğru ve eksiksiz bir şekilde doldurunuz</span>
                        </a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade show active" role="tabpanel" id="login">
                        <form runat="server" method="post">

                            <div class="form-group">

                                <div class="input-group">
                                    <input required class="form-control" runat="server" id="txtSiteAdi" name="txtSiteAdi" type="text"
                                        placeholder="Site Adı">
                                </div>
                            </div>


                            <div class="form-group password-field">

                                <div class="input-group">
            
    <input required  class="form-control" runat="server" id="txtKelime" name="txtKelime" type="text"
    placeholder="Kelime">

            <div class="input-group-append cursor-pointer">
                <span class="input-group-text">

                </span>
            </div>
        </div>


                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <button class="btn btn-primary btn-block" id="btnSiraBul" runat="server" onserverclick="btnSiraBul_ServerClick">Sıramı Bul</button>
                                </div>
                            </div>
                        </form>
                        <br />
                        <div class="row">
                            <div class="col-12 mb-2 mb-md-0 col-md-7">
                                
    <label class="btn btn-social btn-block btn-google">
        Sonuç:  <label runat="server" id="lblSonuc"></label>
    </label>

                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>

    </div>

    <script src="Assets/js/jquery-3.4.1.min.js"></script>
    <script src="Assets/js/bootstrap.min.js"></script>
    <script src="Assets/js/main.js"></script>
    <script src="Assets/js/demo.js"></script>

</body>
</html>
