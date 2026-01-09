#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QRegularExpression>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    connect(ui->numLine, &QLineEdit::textEdited, [this](const QString &curText){
        QRegularExpression exp("\\+\\d{11}$");
        if(exp.match(curText).hasMatch())
            setTrue();
        else
            setFalse();
    });
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::setTrue(){
    ui->res->setText("True");
    ui->res->setStyleSheet("QLabel {color : green;}");
}

void MainWindow::setFalse(){
    ui->res->setText("Invalid");
    ui->res->setStyleSheet("QLabel {color : red;}");
}
