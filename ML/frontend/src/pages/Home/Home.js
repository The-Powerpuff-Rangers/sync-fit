import React from 'react'
import { Link } from 'react-router-dom'

import './Home.css'

export default function Home() {

    return (
        <div className='home-container'>
            <div className='home-header'>
               
                    <h1 className='home-heading'>SyncFit AI</h1>
                
            </div>

            <h1 className="description">Yoga AI Trainer</h1>
            <div className="home-main">
            
                <div className="btn-section">
                    
                    <Link to='/start'>
                        <button
                            className="btn start-btn"
                        >Let's Start</button>
                    </Link>
                    

                </div>
            
            </div>
        </div>
    )
}
