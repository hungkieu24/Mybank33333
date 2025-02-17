<%-- 
    Document   : faq-management
    Created on : Feb 13, 2025, 1:15:17 PM
    Author     : ADMIN
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>FAQ Management</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="HandheldFriendly" content="true">
        <meta name="author" content="bslthemes" />

        <!-- switzer font css -->
        <link rel="stylesheet" href="fonts/css/switzer.css" type="text/css" media="all">
        <!-- font awesome css -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">        <!-- bootstrap grid css -->
        <link rel="stylesheet" href="css/plugins/bootstrap-grid.css" type="text/css" media="all">
        <!-- swiper css -->
        <link rel="stylesheet" href="css/plugins/swiper.min.css" type="text/css" media="all">
        <!-- magnific popup -->
        <link rel="stylesheet" href="css/plugins/magnific-popup.css" type="text/css" media="all">
        <!-- plax css -->
        <link rel="stylesheet" href="css/style.css" type="text/css" media="all">

        <!-- Favicon -->
        <link rel="shortcut icon" href="img/favicon.png" type="image/x-icon">
        <link rel="icon" href="img/favicon.png" type="image/x-icon">

        <style>
            .news-management {
                padding: 30px;
                max-width: 1200px;
                margin: 0 auto;
            }

            .page-title {
                color: #2e7d32;
                font-size: 2em;
                margin-bottom: 30px;
                font-weight: 600;
                text-align: center;
            }

            .news-table {
                width: 100%;
                border-collapse: separate;
                border-spacing: 0;
                background: white;
                border-radius: 15px;
                overflow: hidden;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
            }

            .news-table th {
                background: #4caf50;
                color: white;
                font-weight: 600;
                padding: 15px;
                text-align: left;
                font-size: 0.95em;
                text-transform: uppercase;
                letter-spacing: 0.5px;
            }

            .news-table th.center-align {
                text-align: center;
            }

            .news-table td {
                padding: 15px;
                border-bottom: 1px solid #e8f5e9;
                color: #333;
                font-size: 0.95em;
            }

            .news-table td.center-align {
                text-align: center;
            }

            .news-table tr:last-child td {
                border-bottom: none;
            }

            .news-table tr:nth-child(even) {
                background-color: #f8fdf8;
            }

            .news-table tr:hover td {
                background-color: #e8f5e9;
            }

            .news-table th.id-column {
                width: 60px;
            }

            .news-table th.author-column {
                width: 20%;
            }

            .news-table th.title-column {
                width: 35%;
            }

            .news-table th.status-column {
                width: 100px;
            }

            .news-table th.time-column {
                width: 120px;
            }

            .news-table th.access-column {
                width: 80px;
            }

            .news-table th.actions-column {
                width: 180px;
            }

            .action-buttons-container {
                display: flex;
                gap: 10px;
                justify-content: center;
            }

            .action-button {
                padding: 8px 12px;
                border-radius: 8px;
                border: none;
                font-weight: 500;
                cursor: pointer;
                transition: all 0.3s ease;
                font-size: 0.9em;
                text-decoration: none;
                display: inline-block;
                text-align: center;
                min-width: 80px;
            }

            .update-btn {
                background: #4caf50;
                color: white;
            }

            .update-btn:hover {
                background: #43a047;
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(76, 175, 80, 0.2);
            }

            .activate-btn {
                background: #2196f3;
                color: white;
            }

            .activate-btn:hover {
                background: #1e88e5;
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(33, 150, 243, 0.2);
            }

            .inactivate-btn {
                background: #f44336;
                color: white;
            }

            .inactivate-btn:hover {
                background: #e53935;
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(244, 67, 54, 0.2);
            }

            .action-column {
                white-space: nowrap;
                text-align: center;
            }

            .created-time {
                color: #666;
                font-size: 0.9em;
            }

            .access-count {
                font-weight: 500;
                color: #1976d2;
            }

            .author-name {
                color: #333;
                font-weight: 500;
            }

            .news-title {
                font-weight: 500;
                color: #2e7d32;
                text-decoration: none;
            }

            .news-title:hover {
                color: #43a047;
            }

            .pagination {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-top: 20px;
                gap: 10px;
            }

            .pagination-button {
                padding: 8px 16px;
                border: 1px solid #4caf50;
                background-color: white;
                color: #4caf50;
                cursor: pointer;
                border-radius: 4px;
                transition: all 0.3s ease;
            }

            .pagination-button:hover {
                background-color: #4caf50;
                color: white;
            }

            .pagination-button.active {
                background-color: #4caf50;
                color: white;
            }

            .pagination-button:disabled {
                border-color: #ccc;
                color: #ccc;
                cursor: not-allowed;
            }

            .pagination-info {
                color: #666;
                font-size: 0.9em;
            }

            /* Search Box */
            .search-container {
                position: relative;
                margin-bottom: 20px;
                max-width:50%;
                display: flex;
                gap: 10px;

            }

            .search-container i {
                position: absolute;
                left: 8px;
                top: 50%;
                transform: translateY(-50%);
                color: #666;
                font-size: 0.9em;
            }

            .search-input {
                padding: 6px 6px 6px 28px;
                border: 1px solid #ddd;
                border-radius: 6px;
                width: 100%;
                font-size: 0.9em;
            }

            /* Sort arrows styling */
            .sortable {
                position: relative;
                cursor: pointer;
            }

            .sort-icons {
                display: inline-block;
                margin-left: 5px;
                vertical-align: middle;
            }

            .icon-sort,
            .fa-caret-up,
            .fa-caret-down {
                color: white;
                font-size: 1.5em;
                margin-left: 5px;
                vertical-align: middle;
            }

            .sort-icons i {
                display: block;
                font-size: 0.8em;
                line-height: 0.8em;
                color: #999;
            }

            .sort-icons i.active {
                color: #4caf50;
            }

            /* Filter styling */
            .filter-group {
                background: white;
                padding: 15px;
                border-radius: 10px;
                box-shadow: 0 2px 8px rgba(0,0,0,0.1);
                margin-bottom: 20px;
            }
            .filter-controls h3{
                text-align: center;
            }

            .filter-group label {
                font-weight: 500;
                color: #333;
                margin-right: 15px;
            }

            .filter-group select {
                padding: 8px 12px;
                border: 1px solid #ddd;
                border-radius: 6px;
                background-color: white;
                color: #333;
                font-size: 0.95em;
            }

            .mine-checkbox {
                margin-left: 20px;
            }

            .mine-checkbox input[type="checkbox"] {
                margin-right: 8px;
            }

            /* Toast Message Styles */
            .toast-message {
                position: fixed;
                top: -100px; /* Start above viewport */
                left: 50%;
                transform: translateX(-50%);
                background-color: #4CAF50;
                color: white;
                padding: 16px 32px;
                border-radius: 8px;
                font-size: 16px;
                font-weight: 500;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
                display: flex;
                align-items: center;
                gap: 12px;
                z-index: 1000;
                transition: top 0.5s ease-in-out;
            }

            .toast-message.show {
                top: 20px; /* Slide down to this position */
            }

            .toast-message i {
                font-size: 24px;
            }

            /* Modal Styles */
            .modal {
                display: none;
                position: fixed;
                z-index: 1000;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
            }

            .modal-content {
                background-color: #fefefe;
                margin: 5% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 80%;
                max-width: 800px;
                border-radius: 8px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }

            .modal-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 20px;
                padding-bottom: 10px;
                border-bottom: 1px solid #eee;
            }

            .modal-title {
                color: #2e7d32;
                font-size: 1.5em;
                margin: 0;
            }

            .close-modal {
                color: #aaa;
                font-size: 28px;
                font-weight: bold;
                cursor: pointer;
                transition: color 0.3s ease;
            }

            .close-modal:hover {
                color: #666;
            }

            .modal-body {
                margin-bottom: 20px;
                display: flex;
                gap: 20px;
            }

            .news-description {
                color: #333;
                line-height: 1.6;
                flex: 6;
                padding-right: 20px;
            }

            .news-image-container {
                flex: 4;
                display: flex;
                align-items: flex-start;
            }

            .news-image {
                width: 100%;
                height: auto;
                border-radius: 4px;
                object-fit: cover;
            }

            .show-all-news-btn,
            .add-news-btn {
                padding: 10px 20px;
                border-radius: 8px;
                font-weight: 600;
                text-transform: uppercase;
                letter-spacing: 0.5px;
                cursor: pointer;
                transition: all 0.3s ease;
                border: none;
                font-size: 0.9em;
                margin: 10px 0;
                display: inline-block;
                text-align: center;
                text-decoration: none;
            }

            .show-all-news-btn {
                background-color: #e0e0e0;
                color: #333;
                border: 1px solid #ccc;
            }

            .show-all-news-btn:hover {
                background-color: #d0d0d0;
                transform: translateY(-2px);
                box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            }

            .add-news-btn {
                background-color: #008000;
                color: white;
            }

            .add-news-btn:hover {
                background-color: #43a047;
                transform: translateY(-2px);
                box-shadow: 0 4px 6px rgba(76,175,80,0.2);
            }
            .checkbox-bar {
                display: flex;
                justify-content: space-around;
                background-color: #f4f4f4;
                padding: 10px;
            }
            .checkbox-item {
                display: flex;
                align-items: center;
            }
            .checkbox-item label {
                margin-left: 5px;
            }

            @media (max-width: 768px) {
                .news-management {
                    padding: 15px;
                }

                .news-table {
                    display: block;
                    overflow-x: auto;
                    width: 100%;
                    table-layout: fixed;
                }

                .action-button {
                    padding: 6px 12px;
                    font-size: 0.85em;
                }

                .modal-body {
                    flex-direction: column;
                }

                .news-description {
                    padding-right: 0;
                }

                .news-image-container {
                    width: 100%;
                }

                .icon-sort {
                    font-size: 2px;
                    color: white;

                }
            }
        </style>
    </head>
    <body>

        <c:if test="${not empty sessionScope.message}">
            <div id="toastMessage" class="toast-message">
                <i class="fa fa-check-circle"></i>
                ${sessionScope.message}
            </div>
        </c:if>

        <div class="news-management">
            <h1 class="page-title">FAQ Management</h1>

            <!-- Filter Controls -->
            <form action="faq-search-question" method="post" class="filter-controls">
                <!-- Search Box -->
                <div class="search-container"  >
                    <i class="fa fa-search"></i>
                    <input   type="text" name="searchKeyword" value="${param.searchKeyword}" placeholder="Search questions..." class="search-input">
                    <button class="add-news-btn" type="submit" >Search </button>
                </div>
            </form>

            <form action="faq-search-type" method="post" class="filter-controls">
                <div class="filter-group">
                    <h3>Câu hỏi về</h3>
                    <div class="checkbox-bar">
                        <div class="checkbox-item">
                            <input type="checkbox" id="faq1" name="faqType" value="account">
                            <label for="faq1">Tải khoản ngân hàng</label>
                        </div>
                        <div class="checkbox-item">
                            <input type="checkbox" id="faq2" name="faqType" value="borrow">
                            <label for="faq2">Vay tiền</label>
                        </div>
                        <div class="checkbox-item">
                            <input type="checkbox" id="faq3" name="faqType" value="savings">
                            <label for="faq3">Gửi tiền</label>
                        </div>
                        <div class="checkbox-item">
                            <input type="checkbox" id="faq4" name="faqType" value="card">
                            <label for="faq4">Thẻ</label>
                        </div>
                        <div class="checkbox-item">
                            <button class="add-news-btn" type="submit" >Search </button>
                        </div>
                    </div>
                </div>
            </form>
            <button class="show-all-news-btn" onclick="window.location.href = '/timibank/seller/faq-management'">Show All FAQ</button>
            <button class="add-news-btn" onclick="window.location.href = '/timibank/seller/faq-add'">Add FAQ</button>
            <!-- News Table -->
            <form action="faq-update"> 
                <table class="news-table" border="1">
                    <colgroup>
                        <col style="width: 10%;"> <!-- Cột ID -->
                        <col style="width: 30%;"> <!-- Cột Questions -->
                        <col style="width: 50%;"> <!-- Cột Answers (lớn nhất) -->
                        <col style="width: 10%;"> <!-- Cột Actions -->
                    </colgroup>
                    <thead>
                        <tr>
                            <th class="id-column center-align">ID</th>                    
                            <th class="title-column">Câu hỏi</th>
                            <th class="status-column">Câu trả lời</th>
                            <th class="status-column">Sửa</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listFAQ}" var="f">

                            <tr>
                                <td class="center-align">${f.getFaqID()}</td>                        
                                <td class="created-time">${f.getQuestion()}</td>
                                <td class="access-count">${f.getAnswer()}</td>
                                <td> 
                                    <button type="submit" name="FaqID" value="${f.getFaqID()}" class="add-news-btn">
                                        <i class="fa fa-edit"></i>
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </form>


            <!-- Pagination Controls -->
            <div class="pagination">
                <button class="pagination-button" onclick="changePage(${currentPage - 1})" ${currentPage == 1 ? 'disabled' : ''}>
                    Previous
                </button>

                <c:forEach begin="1" end="${totalPages}" var="page">
                    <button class="pagination-button ${currentPage == page ? 'active' : ''}" 
                            onclick="changePage(${page})">
                        ${page}
                    </button>
                </c:forEach>

                <button class="pagination-button" onclick="changePage(${currentPage + 1})" ${currentPage == totalPages ? 'disabled' : ''}>
                    Next
                </button>

                <span class="pagination-info">
                    Page ${currentPage} of ${totalPages}
                </span>
            </div>
        </div>

        <!-- News Modal -->
        <div id="newsModal" class="modal">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title" id="modalTitle"></h2>
                    <span class="close-modal" onclick="closeNewsModal()">&times;</span>
                </div>
                <div class="modal-body">
                    <p class="news-description" id="modalDescription"></p>
                    <div class="news-image-container">
                        <img id="modalImage" class="news-image" src="" alt="News Image">
                    </div>
                </div>
            </div>
        </div>

        <script>
            function changePage(page) {
                const form = document.querySelector('.filter-controls');
                const input = document.createElement('input');
                input.type = 'hidden';
                input.name = 'page';
                input.value = page;
                form.appendChild(input);
                form.submit();
            }

            function showNewsModal(title, description, image) {
                const modal = document.getElementById('newsModal');
                const modalTitle = document.getElementById('modalTitle');
                const modalDescription = document.getElementById('modalDescription');
                const modalImage = document.getElementById('modalImage');

                modalTitle.textContent = title;
                modalDescription.innerHTML = description;
                modalImage.src = image;

                modal.style.display = 'block';
            }

            function closeNewsModal() {
                const modal = document.getElementById('newsModal');
                modal.style.display = 'none';
            }

            // Close modal when clicking outside of it
            window.onclick = function (event) {
                const modal = document.getElementById('newsModal');
                if (event.target == modal) {
                    modal.style.display = 'none';
                }
            }

            // Toast message animation
            document.addEventListener('DOMContentLoaded', function () {
                const toast = document.getElementById('toastMessage');
                if (toast) {
                    // Show toast
                    setTimeout(() => {
                        toast.classList.add('show');
                    }, 100);

                    // Hide toast after 3 seconds
                    setTimeout(() => {
                        toast.classList.remove('show');
                        // Remove toast from DOM after animation
                        setTimeout(() => {
                            toast.remove();
                        }, 500);
                    }, 3000);
                }
            });

            function updateURLParameter(param, value) {
                let url = new URL(window.location.href);
                let params = new URLSearchParams(url.search);

                params.set(param, value);
                params.delete('fromUpdate');

                window.location.search = params.toString();
            }
        </script>

    </body>
</html>