/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package complaints;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.swing.ImageIcon;
import javax.swing.JOptionPane;
import static javax.swing.JOptionPane.INFORMATION_MESSAGE;
import static javax.swing.JOptionPane.YES_NO_OPTION;
import static javax.swing.JOptionPane.YES_OPTION;

/**
 *
 * @author mukesh
 */

//declaring some form wide variables

public class complaint_reg extends javax.swing.JFrame {
    
    String usernameGlobal;
    /**
     * Creates new form complaint_reg
     */
    public complaint_reg() {
        initComponents();
    }
    
    public complaint_reg(String user) {
        initComponents();
        usernameGlobal=user;
        
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        nameLbl = new javax.swing.JLabel();
        signout_btn = new javax.swing.JButton();
        usernameLbl = new javax.swing.JLabel();
        jLabel1 = new javax.swing.JLabel();
        jPanel1 = new javax.swing.JPanel();
        jLabel2 = new javax.swing.JLabel();
        complaintTypeCB = new javax.swing.JComboBox<>();
        jLabel3 = new javax.swing.JLabel();
        comp_deptCB = new javax.swing.JComboBox<>();
        compl_panel = new javax.swing.JPanel();
        jLabel4 = new javax.swing.JLabel();
        roll_noTxt = new javax.swing.JTextField();
        room_Txt = new javax.swing.JTextField();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        hostel_CB = new javax.swing.JComboBox<>();
        editBtn = new javax.swing.JButton();
        desc_panel = new javax.swing.JPanel();
        jLabel7 = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        desc_TA = new javax.swing.JTextArea();
        loc_panel = new javax.swing.JPanel();
        jLabel8 = new javax.swing.JLabel();
        loc_Txt = new javax.swing.JTextField();
        registerBtn = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setResizable(false);
        addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowOpened(java.awt.event.WindowEvent evt) {
                formWindowOpened(evt);
            }
        });

        nameLbl.setBackground(new java.awt.Color(33, 75, 140));
        nameLbl.setFont(new java.awt.Font("Lato Heavy", 0, 18)); // NOI18N
        nameLbl.setForeground(new java.awt.Color(255, 255, 255));
        nameLbl.setBorder(null);
        nameLbl.setOpaque(true);

        signout_btn.setBackground(new java.awt.Color(204, 16, 22));
        signout_btn.setFont(new java.awt.Font("Lato Heavy", 0, 18)); // NOI18N
        signout_btn.setForeground(new java.awt.Color(255, 255, 255));
        signout_btn.setText("Sign Out");
        signout_btn.setBorder(null);
        signout_btn.setBorderPainted(false);
        signout_btn.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                signout_btnActionPerformed(evt);
            }
        });

        usernameLbl.setBackground(new java.awt.Color(33, 75, 140));
        usernameLbl.setFont(new java.awt.Font("Lato Heavy", 0, 18)); // NOI18N
        usernameLbl.setForeground(new java.awt.Color(255, 255, 255));
        usernameLbl.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        usernameLbl.setBorder(null);
        usernameLbl.setOpaque(true);

        jLabel1.setFont(new java.awt.Font("Ubuntu", 1, 18)); // NOI18N
        jLabel1.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel1.setText("COMPLAINT REGISTARTION");

        jLabel2.setText("Complaint Type: ");

        complaintTypeCB.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { " ", "Public    (Common Places)", "Private  (Room Wise)" }));
        complaintTypeCB.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                complaintTypeCBActionPerformed(evt);
            }
        });

        jLabel3.setText("Department:");

        comp_deptCB.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Civil", "Electrical", "Network", "General" }));
        comp_deptCB.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                comp_deptCBActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(95, 95, 95)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel2)
                    .addComponent(jLabel3))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 129, Short.MAX_VALUE)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(complaintTypeCB, javax.swing.GroupLayout.PREFERRED_SIZE, 221, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(comp_deptCB, javax.swing.GroupLayout.PREFERRED_SIZE, 221, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(59, 59, 59))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(27, 27, 27)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel3)
                    .addComponent(comp_deptCB, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2)
                    .addComponent(complaintTypeCB, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(21, Short.MAX_VALUE))
        );

        compl_panel.setBorder(javax.swing.BorderFactory.createTitledBorder("Complainant Details (Person on whose behalf complaint is raised)"));

        jLabel4.setText("Roll No :");

        jLabel5.setText("Room No :");

        jLabel6.setText("Hostel :");

        hostel_CB.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "ASHOKA", "ASHWATHA BOYS WING", "ASHWATHA GIRLS WING" }));

        editBtn.setFont(new java.awt.Font("Ubuntu", 1, 15)); // NOI18N
        editBtn.setForeground(new java.awt.Color(1, 91, 233));
        editBtn.setText("<html>\n<u>Edit Details</u>\n</html>");
        editBtn.setBorder(null);
        editBtn.setBorderPainted(false);
        editBtn.setContentAreaFilled(false);
        editBtn.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);
        editBtn.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                editBtnActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout compl_panelLayout = new javax.swing.GroupLayout(compl_panel);
        compl_panel.setLayout(compl_panelLayout);
        compl_panelLayout.setHorizontalGroup(
            compl_panelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, compl_panelLayout.createSequentialGroup()
                .addGap(88, 88, 88)
                .addGroup(compl_panelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(compl_panelLayout.createSequentialGroup()
                        .addComponent(jLabel6)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(hostel_CB, javax.swing.GroupLayout.PREFERRED_SIZE, 223, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(compl_panelLayout.createSequentialGroup()
                        .addGroup(compl_panelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel4)
                            .addComponent(jLabel5))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 173, Short.MAX_VALUE)
                        .addGroup(compl_panelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(roll_noTxt, javax.swing.GroupLayout.PREFERRED_SIZE, 223, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(room_Txt, javax.swing.GroupLayout.PREFERRED_SIZE, 223, javax.swing.GroupLayout.PREFERRED_SIZE))))
                .addGap(54, 54, 54))
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, compl_panelLayout.createSequentialGroup()
                .addGap(0, 0, Short.MAX_VALUE)
                .addComponent(editBtn, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
        );
        compl_panelLayout.setVerticalGroup(
            compl_panelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(compl_panelLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(compl_panelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel4)
                    .addComponent(roll_noTxt, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(compl_panelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(room_Txt, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel5))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(compl_panelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel6)
                    .addComponent(hostel_CB, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 9, Short.MAX_VALUE)
                .addComponent(editBtn, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
        );

        jLabel7.setText("Description :");

        desc_TA.setColumns(20);
        desc_TA.setRows(5);
        jScrollPane1.setViewportView(desc_TA);

        javax.swing.GroupLayout desc_panelLayout = new javax.swing.GroupLayout(desc_panel);
        desc_panel.setLayout(desc_panelLayout);
        desc_panelLayout.setHorizontalGroup(
            desc_panelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(desc_panelLayout.createSequentialGroup()
                .addContainerGap(91, Short.MAX_VALUE)
                .addComponent(jLabel7)
                .addGap(52, 52, 52)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 384, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(55, 55, 55))
        );
        desc_panelLayout.setVerticalGroup(
            desc_panelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(desc_panelLayout.createSequentialGroup()
                .addGroup(desc_panelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel7))
                .addGap(0, 13, Short.MAX_VALUE))
        );

        jLabel8.setText("Location :");

        javax.swing.GroupLayout loc_panelLayout = new javax.swing.GroupLayout(loc_panel);
        loc_panel.setLayout(loc_panelLayout);
        loc_panelLayout.setHorizontalGroup(
            loc_panelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(loc_panelLayout.createSequentialGroup()
                .addGap(91, 91, 91)
                .addComponent(jLabel8)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 73, Short.MAX_VALUE)
                .addComponent(loc_Txt, javax.swing.GroupLayout.PREFERRED_SIZE, 376, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );
        loc_panelLayout.setVerticalGroup(
            loc_panelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, loc_panelLayout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGroup(loc_panelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel8)
                    .addComponent(loc_Txt, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );

        registerBtn.setBackground(new java.awt.Color(226, 0, 11));
        registerBtn.setFont(new java.awt.Font("Ubuntu", 1, 18)); // NOI18N
        registerBtn.setForeground(new java.awt.Color(255, 255, 255));
        registerBtn.setText("REGISTER YOUR COMPLAINT");
        registerBtn.setBorder(new javax.swing.border.SoftBevelBorder(javax.swing.border.BevelBorder.RAISED));
        registerBtn.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                registerBtnActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(nameLbl, javax.swing.GroupLayout.PREFERRED_SIZE, 501, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, 0)
                .addComponent(usernameLbl, javax.swing.GroupLayout.PREFERRED_SIZE, 255, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, 0)
                .addComponent(signout_btn, javax.swing.GroupLayout.PREFERRED_SIZE, 112, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, Short.MAX_VALUE))
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(242, 242, 242)
                        .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 371, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(87, 87, 87)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(compl_panel, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(desc_panel, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(loc_panel, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(275, 275, 275)
                        .addComponent(registerBtn, javax.swing.GroupLayout.PREFERRED_SIZE, 291, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(nameLbl, javax.swing.GroupLayout.PREFERRED_SIZE, 40, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(usernameLbl, javax.swing.GroupLayout.PREFERRED_SIZE, 40, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(signout_btn, javax.swing.GroupLayout.PREFERRED_SIZE, 40, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(compl_panel, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(desc_panel, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(loc_panel, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(registerBtn, javax.swing.GroupLayout.PREFERRED_SIZE, 41, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(21, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void formWindowOpened(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_formWindowOpened
        // TODO add your handling code here: 
                    
        compl_panel.setVisible(false);
        desc_panel.setVisible(false);
        loc_panel.setVisible(false);
        
        roll_noTxt.setEnabled(false);
        room_Txt.setEnabled(false);
        hostel_CB.setEnabled(false);
        
        registerBtn.setVisible(false);
        
        try
        {
            Class.forName("java.sql.DriverManager");
            
            String host="localhost";
            String port="3306";
            String dbname="COMPLAINTS";
            String username="complaints";
            String password="iiitdm123";
            
            String dburl="jdbc:mysql://"+host+":"+port+"/"+dbname;
            
            Connection con = (Connection) DriverManager.getConnection(dburl, username,password);
            Statement stmt = (Statement) con.createStatement();
            
            String query="Select CONCAT(fname,' ',lname) NAME  from students where username like '"+usernameGlobal+"'";
            
            ResultSet rs=stmt.executeQuery(query);
            
            if(rs.next())
            {
                String name=rs.getString("NAME");
                nameLbl.setText("          Welcome, "+name);
                usernameLbl.setText(usernameGlobal);
            }
            
            else
            {
                JOptionPane.showMessageDialog(this, "Session ERROR. The username is INVALID!");
                System.exit(1);
            }
            
            rs.close();
            stmt.close();
            con.close();
        }
        
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(this, e.getMessage());
        }
    }//GEN-LAST:event_formWindowOpened

    private void complaintTypeCBActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_complaintTypeCBActionPerformed
        // TODO add your handling code here:
        String first_item=complaintTypeCB.getItemAt(0);
        String compl_type=(String) complaintTypeCB.getSelectedItem();
         
        if(first_item.equals(" ") && !compl_type.equals(" "))
            complaintTypeCB.removeItemAt(0);

        if(compl_type.equals("Public    (Common Places)"))
        {
            compl_panel.setVisible(false);
            desc_panel.setVisible(true);
            loc_panel.setVisible(true);
            
            registerBtn.setVisible(true);
        }
        
        else if(compl_type.equals("Private  (Room Wise)"))
        {
            compl_panel.setVisible(true);
            desc_panel.setVisible(true);
            loc_panel.setVisible(false);
            
            registerBtn.setVisible(true);
            
            //autofill the complainant details from username
            try
            {
                Class.forName("java.sql.DriverManager");

                String host="localhost";
                String port="3306";
                String dbname="COMPLAINTS";
                String username="complaints";
                String password="iiitdm123";

                String dburl="jdbc:mysql://"+host+":"+port+"/"+dbname;

                Connection con = (Connection) DriverManager.getConnection(dburl, username,password);
                Statement stmt = (Statement) con.createStatement();
                
                String query="Select roll_no, room_no, hostel_name from students where username like '"+usernameGlobal+"'";
                
                ResultSet rs=stmt.executeQuery(query);
                
                if(rs.next())
                {
                    String roll_no=rs.getString("roll_no");
                    String room_no=rs.getString("room_no");
                    String hostel_name=rs.getString("hostel_name");
                    
                    roll_noTxt.setText(roll_no);
                    room_Txt.setText(room_no);
                    hostel_CB.setSelectedItem(hostel_name);
                                       
                }
                
                else
                {
                    JOptionPane.showMessageDialog(this, "Session ERROR. The username is INVALID!");
                    System.exit(0);
                }
            }
            
            catch(Exception e)
            {
                 JOptionPane.showMessageDialog(this, e.getMessage());
            }
            
        }
    }//GEN-LAST:event_complaintTypeCBActionPerformed

    private void comp_deptCBActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_comp_deptCBActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_comp_deptCBActionPerformed

    private void editBtnActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_editBtnActionPerformed
        // TODO add your handling code here:
        roll_noTxt.setEnabled(true);
        room_Txt.setEnabled(true);
        hostel_CB.setEnabled(true);
        
        editBtn.setVisible(false);
    }//GEN-LAST:event_editBtnActionPerformed

    private void signout_btnActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_signout_btnActionPerformed
        // TODO add your handling code here:
        int choice=JOptionPane.showConfirmDialog(this, "Do you really want to SIGN OUT ?","USER LOGOUT",YES_NO_OPTION);
        if(choice==YES_OPTION)
        {
            this.setVisible(false);
            new login().setVisible(true);
        }
    }//GEN-LAST:event_signout_btnActionPerformed

    private void registerBtnActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_registerBtnActionPerformed
        // TODO add your handling code here:
        try
        {
            Class.forName("java.sql.DriverManager");

            String host="localhost";
            String port="3306";
            String dbname="COMPLAINTS";
            String username="complaints";
            String password="iiitdm123";

            String dburl="jdbc:mysql://"+host+":"+port+"/"+dbname;

            Connection con = (Connection) DriverManager.getConnection(dburl, username,password);
            Statement stmt = (Statement) con.createStatement();
            
            String comp_dept=(String) comp_deptCB.getSelectedItem();
            String comp_type=(String) complaintTypeCB.getSelectedItem();
            
            if(comp_type.equals("Public    (Common Places)"))
            {
                String description=desc_TA.getText();
                String location=loc_Txt.getText();
                
                if(description.isEmpty() || location.isEmpty())
                    JOptionPane.showMessageDialog(this, "Please enter valid details !");
                
                else
                {
                    String base_query="INSERT INTO public_complaints(username,type,description,status,location) VALUES";
                    String parameters="'"+usernameGlobal+"','"+comp_dept+"','"+description+"','TECHNICIAN','"+location+"'";
                    
                    String query=base_query+"("+parameters+")";
                    stmt.execute(query);
                    
                    final ImageIcon icon = new ImageIcon("src/complaints/images/success1.png");
                    JOptionPane.showMessageDialog(this, "Complaint successfully registered !", "COMPLAINT REGISTRATION", INFORMATION_MESSAGE , icon);
                    
                }
            }
            
            else if(comp_type.equals("Private  (Room Wise)"))
            {
                String roll_no=roll_noTxt.getText();
                String room_no=room_Txt.getText();
                String hostel=(String) hostel_CB.getSelectedItem();
                
                String description=desc_TA.getText();
                
                if(roll_no.isEmpty() || room_no.isEmpty() || description.isEmpty())
                    JOptionPane.showMessageDialog(this, "Please enter valid details !");
                
                else
                {
                    String base_query="INSERT INTO private_complaints(username,type,roll_no,c_roomno,c_hostel,description,status) values";
                    String parameters="'"+usernameGlobal+"','"+comp_dept+"','"+roll_no+"',"+room_no+",'"+hostel+"','"+description+"','TECHNICIAN'";
                    String query=base_query+"("+parameters+")";
                
                    stmt.execute(query);
                    
                    final ImageIcon icon = new ImageIcon("src/complaints/images/success1.png");
                    JOptionPane.showMessageDialog(this, "Complaint successfully registered !", "COMPLAINT REGISTRATION", INFORMATION_MESSAGE , icon);
                }
                
                stmt.close();
                con.close();
                
            }
        }
        
        catch(Exception e)
        {
            JOptionPane.showMessageDialog(this, e.getMessage());
        }
        
        
        
    }//GEN-LAST:event_registerBtnActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(complaint_reg.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(complaint_reg.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(complaint_reg.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(complaint_reg.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new complaint_reg().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JComboBox<String> comp_deptCB;
    private javax.swing.JPanel compl_panel;
    private javax.swing.JComboBox<String> complaintTypeCB;
    private javax.swing.JTextArea desc_TA;
    private javax.swing.JPanel desc_panel;
    private javax.swing.JButton editBtn;
    private javax.swing.JComboBox<String> hostel_CB;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTextField loc_Txt;
    private javax.swing.JPanel loc_panel;
    private javax.swing.JLabel nameLbl;
    private javax.swing.JButton registerBtn;
    private javax.swing.JTextField roll_noTxt;
    private javax.swing.JTextField room_Txt;
    private javax.swing.JButton signout_btn;
    private javax.swing.JLabel usernameLbl;
    // End of variables declaration//GEN-END:variables
}
