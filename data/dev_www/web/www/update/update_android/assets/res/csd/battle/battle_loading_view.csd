<GameFile>
  <PropertyGroup Name="battle_loading_view" Type="Layer" ID="9v8f0w5kd-heqsorpxl1j6t2nab4g7zuim3y" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="0" Speed="1.000000">
      </Animation>
      <ObjectData Name="root_wnd" ctype="GameNodeObjectData">
        <Size X="1280.000000" Y="720.000000" />
        <Children>
          <AbstractNodeData Name="progeass_container" ActionTag="1576629663" Tag="3" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="653" BottomMargin="0" TouchEnable="True" BackColorAlpha="102" Scale9Enable="True" LeftEage="-10" RightEage="-10" TopEage="-20" BottomEage="-20" Scale9OriginX="-10" Scale9OriginY="-20" Scale9Width="20" Scale9Height="30" ctype="PanelObjectData">
            <Size Y="67" X="1280" />
            <AnchorPoint ScaleX="0" ScaleY="0" />
            <Position X="0" Y="0" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="255" G="255" R="255" />
            <FileData />
            <FirstColor A="255" B="255" G="200" R="150" />
            <EndColor A="255" B="255" G="255" R="255" />
            <ColorVector ScaleX="0" ScaleY="1" />
            <SingleColor A="255" B="255" G="200" R="150" />
            <Children>
              <AbstractNodeData Name="Panel_1" ActionTag="179541602" Tag="28" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" BackColorAlpha="102" Scale9Enable="True" LeftEage="11" RightEage="11" TopEage="13" BottomEage="13" Scale9OriginX="11" Scale9OriginY="13" Scale9Width="13" Scale9Height="7" ctype="PanelObjectData">
                <Size Y="67" X="1280" />
                <AnchorPoint ScaleX="0" ScaleY="0" />
                <Position X="0" Y="0" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData />
                <FirstColor A="255" B="255" G="200" R="150" />
                <EndColor A="255" B="255" G="255" R="255" />
                <ColorVector ScaleX="0" ScaleY="1" />
                <SingleColor A="255" B="255" G="200" R="150" />
              </AbstractNodeData>
              <AbstractNodeData Name="Image_1" ActionTag="664743250" Tag="33" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="-653" BottomMargin="0" LeftEage="422" RightEage="422" TopEage="237" BottomEage="237" Scale9OriginX="422" Scale9OriginY="237" Scale9Width="436" Scale9Height="246" ctype="ImageViewObjectData">
                <Size Y="720" X="1280" />
                <AnchorPoint ScaleX="0" ScaleY="0" />
                <Position X="0" Y="0" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="Default" Path="Default/ImageFile.png" Plist="" />
              </AbstractNodeData>
              <AbstractNodeData Name="progress" ActionTag="-736357315" Tag="4" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="47" BottomMargin="0" ProgressInfo="100" ctype="LoadingBarObjectData">
                <Size Y="20" X="1280" />
                <AnchorPoint ScaleX="0" ScaleY="0" />
                <Position X="0" Y="0" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <ImageFileData Type="Default" Path="Default/LoadingBarFile.png" Plist="" />
                <Children>
                  <AbstractNodeData Name="particle_ui" ActionTag="770176077" Tag="5" RotationSkewX="0" RotationSkewY="0" LeftMargin="-45" RightMargin="1277" TopMargin="-4.5" BottomMargin="-2.5" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                    <Size Y="27" X="48" />
                    <AnchorPoint ScaleX="1" ScaleY="0.5" />
                    <Position X="3" Y="11" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="Default" Path="Default/Sprite.png" Plist="" />
                    <BlendFunc Dst="771" Src="1" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="txt_progress" ActionTag="-1347240520" Tag="7" RotationSkewX="0" RotationSkewY="0" LeftMargin="652.031982" RightMargin="627.968018" TopMargin="7.5567" BottomMargin="12.4433" FontSize="18" LabelText="" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="0" X="0" />
                    <AnchorPoint ScaleX="0.5146" ScaleY="0.5202" />
                    <Position X="652.031982" Y="12.4433" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="0" G="128" R="0" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="0" G="0" R="0" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="desc_label" ActionTag="-519677396" Tag="6" RotationSkewX="0" RotationSkewY="0" LeftMargin="588" RightMargin="588" TopMargin="11.0004" BottomMargin="29.999599" FontSize="20" LabelText="Text Label" OutlineEnabled="True" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="26" X="104" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="640" Y="42.999599" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="79" G="207" R="255" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="0" G="0" R="0" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
            </Children>
          </AbstractNodeData>
        </Children>
      </ObjectData>
    </Content>
  </Content>
</GameFile>
