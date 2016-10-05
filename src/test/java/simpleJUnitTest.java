/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author junguan
 */
public class simpleJUnitTest {
    
    public simpleJUnitTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    @Test
    public void sleep10s() throws InterruptedException {
        System.out.println("will sleep 10s");
        Thread.sleep(10*1000);
        System.out.println("done sleep 10s");
        
        assertTrue("assert true", true);
    }

    @Test
    public void sleep1m() throws InterruptedException {
        System.out.println("will sleep 1m");
        Thread.sleep(60*1000);
        System.out.println("done sleep 1m");
        
        assertTrue("assert true", true);
    }
}
