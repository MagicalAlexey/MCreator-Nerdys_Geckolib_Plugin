<#--
 # This file is part of Fabric-Generator-MCreator.
 # Copyright (C) 2012-2020, Pylo
 # Copyright (C) 2020-2021, Pylo, opensource contributors
 # Copyright (C) 2020-2022, Goldorion, opensource contributors
 #
 # Fabric-Generator-MCreator is free software: you can redistribute it and/or modify
 # it under the terms of the GNU Lesser General Public License as published by
 # the Free Software Foundation, either version 3 of the License, or
 # (at your option) any later version.

 # Fabric-Generator-MCreator is distributed in the hope that it will be useful,
 # but WITHOUT ANY WARRANTY; without even the implied warranty of
 # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 # GNU Lesser General Public License for more details.
 #
 # You should have received a copy of the GNU Lesser General Public License
 # along with Fabric-Generator-MCreator.  If not, see <https://www.gnu.org/licenses/>.
-->

<#-- @formatter:off -->
package ${package}.client.renderer;

import net.fabricmc.api.Environment;

<#include "../procedures.java.ftl">

<#assign shadowRadius = "this.shadowRadius = " + data.modelShadowSize + "f;">
public class ${name}Renderer extends GeoEntityRenderer<${name}Entity> {
   public ${name}Renderer(EntityRendererProvider.Context renderManager) {
      super(renderManager, new ${name}Model());
      ${shadowRadius}
     <#if data.mobModelGlowTexture?has_content>
     this.addLayer(new ${name}Layer(this));
     </#if>
   }

   @Override
   public RenderType getRenderType(${name}Entity animatable, float partialTicks, PoseStack stack,
                MultiBufferSource renderTypeBuffer, VertexConsumer vertexBuilder, int packedLightIn,
                ResourceLocation textureLocation) {
		if (!animatable.isBaby())
                stack.scale(1.0F, 1.0F, 1.0F);
		else
		stack.scale(${data.babyScale}F, ${data.babyScale}F, ${data.babyScale}F); 
      return RenderType.entityTranslucent(getTextureLocation(animatable));
   }

   <#if data.disableDeathRotation>
   @Override
	protected float getDeathMaxRotation(${name}Entity entityLivingBaseIn) {
		return 0.0F;
	} 
   </#if>
}