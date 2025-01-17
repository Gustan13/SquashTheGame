//
//  MetalView.hpp
//  SnowSoup
//
//  Created by Guilherme de Souza Barci on 26/08/24.
//

#ifndef MetalView_hpp
#define MetalView_hpp

#include <Foundation/Foundation.h>
#include <Cocoa/Cocoa.h>
#include <MetalKit/MetalKit.h>
#include "Input.hpp"

@interface MetalView : MTKView {
    @private
    Input* input;
}

//- (void)setInputManager : (Input*)input;
@end

#endif /* MetalView_h */
